#!/usr/bin/env zsh

# Enable version control information
setopt prompt_subst

# Remove space after the right prompt.
ZLE_RPROMPT_INDENT=0

autoload -Uz vcs_info
precmd () { vcs_info }

# Symbols for status information
STATUS_UNTRACKED="?"
STATUS_ADDED="+"
STATUS_MODIFIED="!"
# STATUS_RENAMED="»"
# STATUS_DELETED="x"
# STATUS_STASHED="$"
STATUS_AHEAD="%F{4}⇡%f"
STATUS_BEHIND="%F{4}⇣%f"
STATUS_DIVERGED="%F{4}⇕%f"

# Hooks for expanded status information
+vi-untracked() {
  if [[ $(git rev-parse --is-inside-work-tree 2>/dev/null) == 'true'  ]] && \
     [[ -n $(git ls-files --others --exclude-standard) ]] ; then
     hook_com[unstaged]+="%F{3}$STATUS_UNTRACKED"
  fi
}

# hook for stashed files
+vi-stashed() {
  if git rev-parse --verify refs/stash &>/dev/null ; then
    hook_com[unstaged]+='%F{3}$'
  fi
}

# Hook for incoming and outgoing commits
+vi-outgoing() {
	[ -z "$(git rev-parse --is-inside-work-tree 2>/dev/null)" ] && return 0

  # Check whether branch is ahead
  local ahead=$(command git rev-list --count ${git_branch}@{upstream}..HEAD 2>/dev/null)
  local behind=$(command git rev-list --count HEAD..${git_branch}@{upstream} 2>/dev/null)

	git_status=""
  # Check whether branch has diverged
  if (( $ahead )) && (( $behind )); then
    git_status="$STATUS_DIVERGED$git_status"
  elif (( $ahead )); then
    git_status="$STATUS_AHEAD$git_status"
  elif (( $behind )); then
    git_status="$STATUS_BEHIND$git_status"
  fi

	[ -n "$git_status" ] && hook_com[unstaged]+="$git_status"
}

# vcs_info styles
zstyle ':vcs_info:*' enable git
zstyle ':vcs_info:git:*' check-for-changes true
zstyle ':vcs_info:git:*' get-revision true

# overall format: branchname staged unstaged untracked stashed outgoing
# main+!?$⇡
zstyle ':vcs_info:git:*' formats '%F{7}%b%c%u'
zstyle ':vcs_info:git:*' actionformats '%F{7}%b ** %c'
zstyle ':vcs_info:git:*' stagedstr "%F{6}$STATUS_ADDED"
zstyle ':vcs_info:git:*' unstagedstr "%F{3}$STATUS_MODIFIED"
zstyle ':vcs_info:git*+set-message:*' hooks untracked stashed outgoing

## SecretShell custom prompt component
base_secret_indicator="%B%F{1}[SECRET ENV ACTIVE]%f%b "
secretshell_indicator=""
[ "$SECRETSHELL_ACTIVE" = "1" ] && secretshell_indicator=$base_secret_indicator

## Setting the prompt itself:
baseprompt="%F{12}%~%f"
secondline="%(?.%F{10}.%F{9})%(!.#.$)%f"

# ~/current/directory vcs_info
# $

export PROMPT='
$secretshell_indicator$baseprompt $vcs_info_msg_0_
$secondline '
