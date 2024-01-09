#!/usr/bin/env zsh
#######################################################################
# Possum's Dotfiles -- Zsh -- Completion settings
# https://github.com/possumvibes/dotfiles
#######################################################################

fpath=( $ZDOTDIR/completions $fpath )

# Handle slashes gracefully when completing paths,
# and don't leave them there unnecessarily.
setopt auto_param_slash
setopt auto_remove_slash

setopt extended_glob        # Use extended globbing syntax.
_comp_options+=(globdots)   # Include hidden files in completions
setopt no_case_glob

setopt always_to_end        # Move cursor to the end of a completed word.
setopt complete_in_word     # Complete from both ends of a word.

setopt no_complete_aliases  # Complete_aliases prevents aliases or cd from being completed
setopt no_menu_complete
setopt no_flow_control
setopt no_list_ambiguous

setopt list_packed

## Completion Styles ###################################################

# Use the completion cache.
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR/zcompcache
zstyle ':completion::complete:*' use-cache true

# Case insensitive match, followed by partial word, and then substring completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=*' 'l:|=* r:|=*'

# Match display settings
zstyle ':completion:*:*:*:*:*' menu select
zstyle ':completion:*' list-dirs-first true
zstyle ':completion:*' list-prompt ''
zstyle ':completion:*' select-prompt ''
zstyle ':completion:*' group-name ''
zstyle ':completion:*:options'      auto-description '%d'
zstyle ':completion:*:corrections'  format '%F{red}%d (errors: %e)%f'
zstyle ':completion:*:descriptions' format '%F{blue}%d%f'
zstyle ':completion:*:messages'     format '%F{green}%d%f'
zstyle ':completion:*:warnings'     format '%F{yellow}no matches found%f'
zstyle ':completion:*'              format '%F{11}%d%f'
zstyle ':completion:*' verbose yes

zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' squeeze-slashes true

# Grouping results
zstyle ':completion:*:matches'      group 'yes'


# Don't complete private functions or Zsh's precmd/exec special functions,
# and don't complete unavailable commands or internal environment vars.
# and leave the precmd/exec special functions alone.
zstyle ':completion:*:functions' ignored-patterns '(_*|.*|pre(cmd|exec))'
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Matcher styles
zstyle ':completion:*' completer _complete _match _approximate
zstyle ':completion:*:match:*' original only
# zstyle ':completion:*:paths' path-completion yes

# Increase the number of permitted fuzzy match errors
# based on the length of the typed word.
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# Don't complete uninteresting users...
zstyle ':completion:*:*:*:users' ignored-patterns \
  adm amanda apache avahi beaglidx bin cacti canna clamav daemon \
  dbus distcache dovecot fax ftp games gdm gkrellmd gopher \
  hacluster haldaemon halt hsqldb ident junkbust ldap lp mail \
  mailman mailnull mldonkey mysql nagios \
  named netdump news nfsnobody nobody nscd ntp nut nx openvpn \
  operator pcap postfix postgres privoxy pulse pvm quagga radvd \
  rpc rpcuser rpm shutdown squid sshd sync uucp vcsa xfs '_*'

# ... unless we really want to.
zstyle '*' single-ignored show

## Application-specific completion
# ------------------------------------------------------------

# Ignore duplicates in diff and destruction
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true


# History
zstyle ':completion:*:history-words' stop yes
zstyle ':completion:*:history-words' remove-all-dups yes
zstyle ':completion:*:history-words' list false
zstyle ':completion:*:history-words' menu yes

# ----------------------------------------------------------

## Enable Completion #########################################################
# bash completions also
autoload bashcompinit
bashcompinit

# zmodload zsh/complist    # menu-specific bindings, load before compinit
autoload -Uz compinit
compinit -i -C -d $ZSH_CACHE_DIR/completions

# Alias completions not otherwise picked up
compdef "_$EDITOR" e
