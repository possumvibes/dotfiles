#!/bin/sh

## Common Aliases for Bash and Zsh

# workflow apps
alias e="$EDITOR"

alias b='bat'
alias k='kak'
alias t='trash'

# package updates
alias uu='sudo dnf upgrade --refresh -y'

# Shell config files
alias aa="cd ~/.config/shell.d/; kak aliases.sh"
alias fishconf="cd ~/.config/fish; kak config.fish"
alias zconf="cd ~/.config/zsh; $EDITOR .zshrc"

# Editor config files
alias vimrc="cd ~/.config/nvim; nvim init.lua"
alias kakrc="cd ~/.config/kak; kak kakrc"

# Notes
alias notes="cd $NOTEBOOK_DIR; $EDITOR scratchpad.md"

# Reload Xresources
alias xup='xrdb -load ~/.Xresources && echo "reloaded .Xresources"'

# Utilities
alias md='mkdir -p'
alias rm='rm -i'

# navigation and listing
alias l='ls'
alias la='ls -lah'
alias ll='ls -lh'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Config Management
alias cmc="cd $STOWDIR" # config-management cd

