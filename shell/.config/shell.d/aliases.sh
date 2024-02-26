#!/bin/sh
#######################################################################
# Possum's Dotfiles -- Common Shell -- Aliases
# https://github.com/possumvibes/dotfiles
#######################################################################

## Common Aliases for Bash and Zsh

_checkexec (){
    command -v "$1" > /dev/null 
}

# workflow apps
alias e="$EDITOR"

alias b='bat'
alias g='git'
alias k='kak'
alias t='trash'
alias tt='tree'

# package updates
if _checkexec xbps-install; then
    alias uu='sudo xbps-install -Su'
    alias mup='sudo makewhatis /usr/share/man'
    alias xi='sudo xbps-install'
    alias xq='sudo xbps-query'
elif _checkexec dnf; then
    alias uu='sudo dnf upgrade --refresh -y'
elif _checkexec apt; then
    alias uu='sudo apt update && sudo apt upgrade -y'
fi

# Shell config files
alias aa="cd ~/.config/shell.d/; kak aliases.sh"
alias fishconf="cd ~/.config/fish; kak config.fish"
alias zconf="cd ~/.config/zsh; $EDITOR .zshrc"

# Editor config files
alias vimrc="cd ~/.config/nvim; nvim init.lua"
alias kakrc="cd ~/.config/kak; kak kakrc"

# Notes
alias notes="cd $NOTEBOOK_DIR; $EDITOR scratchpad.md"
alias note="cd $NOTEBOOK_DIR"

alias src="cd $REPOSDIR"
alias keeb="cd $QMK_USERSPACE/users/possumvibes"

# Reload Xresources
alias xup='xrdb -load ~/.Xresources && echo "reloaded .Xresources"'

# Utilities
alias md='mkdir -p'

# Better utility defaults
alias cp='cp -rvi'
alias mv='mv -i'
alias rm='rm -I'

# make 'sudo rm' less dangerous
alias srm='sudo rm -i'

# Color!
if [ -x /usr/bin/dircolors ]; then
  test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
  alias ls='ls --color=auto --group-directories-first -pv'
  alias dir='dir --color=auto'
  alias vdir='vdir --color=auto'
  alias grep='grep --color=auto'
  alias fgrep='fgrep --color=auto'
  alias egrep='egrep --color=auto'
fi

# navigation and listing
alias l='ls -pv1 --group-directories-first'
alias la='ls -pvlah --group-directories-first'
alias ll='ls -pvlh --group-directories-first'

# dots navigation
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Config Management
alias cmc="cd ${DOTS_DIR:-$HOME/.dotfiles}" # config-management cd

# Shell With Secrets In (requires pass)
alias priv="secretshell"


