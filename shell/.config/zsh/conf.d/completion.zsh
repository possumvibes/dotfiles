#!/bin/zsh

# Completion settings and zstyles

# Fuzzy match mistyped completions.
zstyle ':completion:*' completer _extensions _complete _list _match _approximate
zstyle ':completion:*:match:*' original only
zstyle ':completion:*:*:*:*:*' menu select 

# Increase the number of errors based on the length of the typed word.
zstyle ':completion:*:approximate:*' max-errors 1 numeric
zstyle -e ':completion:*:approximate:*' max-errors 'reply=($((($#PREFIX+$#SUFFIX)/3))numeric)'

# Case-insensitive matching
zstyle ':completion:*' matcher-list 'm:{a-zA-Z-_}={A-Za-z_-}' 'r:|=*' 'l:|=* r:|=*'

# Use caching to make package manager autocomplete usable
zstyle ':completion::complete:*' use-cache on
zstyle ':completion::complete:*' cache-path $ZSH_CACHE_DIR/zcompcache

# Use ls colors for general listing
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}

# Expand partial paths, e.g. cd f/b/z == cd foo/bar/baz (assuming no ambiguity)
zstyle ':completion:*:paths' path-completion yes

# Don't complete unavailable commands.
zstyle ':completion:*:functions' ignored-patterns '(_*|.*|pre(cmd|exec))'

# Fix slow one-by-one character pasting when bracketed-paste-magic is on. See
# zsh-users/zsh-syntax-highlighting#295
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# Exclude internal/fake envvars
zstyle ':completion::*:(-command-|export):*' fake-parameters ${${${_comps[(I)-value-*]#*,}%%,*}:#-*-}

# Sort array completion candidates
zstyle ':completion:*:*:-subscript-:*' tag-order indexes parameters

# Group completions by tags
zstyle ':completion:*' group-name ''
zstyle ':completion:*:*:-command-:*:*' group-order aliases builtins functions commands

## Application-specific completion

# cd
zstyle ':completion:*:*:cd:*' tag-order local-directories directory-stack path-directories
zstyle ':completion:*:*:cd:*:directory-stack' menu yes select
zstyle ':completion:*:*:cd:*' ignore-parents parent pwd
zstyle ':completion:*:-tilde-:*' group-order 'named-directories' 'path-directories' 'users' 'expand'

# Kill
zstyle ':completion:*:*:*:*:processes' command 'ps -u $LOGNAME -o pid,user,command -w'
zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#) ([0-9a-z-]#)*=01;36=0=01'
zstyle ':completion:*:*:kill:*' menu yes select
zstyle ':completion:*:*:kill:*' force-list always
zstyle ':completion:*:*:kill:*' insert-ids single

# Man
zstyle ':completion:*:manuals' separate-sections true
zstyle ':completion:*:manuals.(^1*)' insert-sections true


