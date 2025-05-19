#!/usr/bin/env zsh

# Once $ZDOTDIR is set, zsh will look here for .zshenv

# Source the common environment, including PATH
# We've already set ZDOTDIR to be able to source this .zshenv,
# but this will set it for keeps anyway
. ~/.config/shell.d/0_env.sh

# Export the XDG dirs for Zsh
export ZSH_CACHE_DIR=$XDG_CACHE_HOME/zsh
[[ -d $ZSH_CACHE_DIR ]] || mkdir -p $ZSH_CACHE_DIR

export ZSH_DATA_DIR=$XDG_DATA_HOME/zsh
[[ -d $ZSH_DATA_DIR ]] || mkdir -p $ZSH_DATA_DIR

# Export a var so .zshrc can avoid double-sourcing the environment if it's already present.
export ZSHENV_SOURCED=true

