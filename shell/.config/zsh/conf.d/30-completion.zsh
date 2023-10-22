#!/usr/bin/env zsh

fpath=($ZDOTDIR/completions $fpath)

# Handle slashes gracefully when completing paths,
# and don't leave them there unnecessarily.
setopt auto_param_slash
setopt auto_remove_slash

setopt extended_glob        # Use extended globbing syntax.
setopt complete_aliases
_comp_options+=(globdots)   # Include hidden files in completions

setopt always_to_end        # Move cursor to the end of a completed word.
setopt complete_in_word     # Complete from both ends of a word.

setopt list_packed

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
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Match pattern rules

# Use case insensitive completion matching,
# and fall back to partial word completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

# Don't complete private functions or Zsh's precmd/exec special functions,
# and don't complete unavailable commands or internal environment vars.
# and leave the precmd/exec special functions alone.
zstyle ':completion:*:functions' ignored-patterns '(_*|.*|pre(cmd|exec))'
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Matcher styles
zstyle ':completion:*' completer _extensions _complete _list _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:paths' path-completion yes

# Increase the number of permitted fuzzy match errors
# based on the length of the typed word.
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

## Application-specific completion
# ------------------------------------------------------------
# cd
zstyle ':completion:*:*:cd:*' ignore-parents parent pwd

# Ignore duplicates in diff and destruction
zstyle ':completion:*:(rm|kill|diff):*' ignore-line other
zstyle ':completion:*:rm:*' file-patterns '*:all-files'

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true
# ----------------------------------------------------------

# Use the completion cache.
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR/zcompcache
zstyle ':completion::complete:*' use-cache true


## Enable completion menu-specific keybindings. enable before compinit
# zmodload zsh/complist          
autoload -Uz compinit
compinit -i -C -d $ZSH_CACHE_DIR/completions

