#!/bin/sh
#######################################################################
# Possum's Dotfiles -- Common Shell -- Environment
# https://github.com/possumvibes/dotfiles
#######################################################################

# Common environment for POSIX-compliant shells
# Including XDG compliance, because *get outta my home dir*

### Common Functions
# Adds a directory to PATH if it exists and is not already present in PATH
pathadd() {
  if [ -d "$1" ] && [[ ! $PATH =~ (^|:)$1(:|$) ]]; then
    PATH="${1}:$PATH"
  fi
}

# Quick check if an executable is known
checkexec() {
    command -v "$1" > /dev/null
}

### XDG Base Directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"

export MAN_HOME="$XDG_DATA_HOME/man"
export SOURCES_HOME="$HOME/sources"

export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Set the first available editor as default,
# ordered in increasing levels of pain.
for editor in kak nvim vim vi micro nano
do
    if checkexec $editor
    then
        export EDITOR=$editor
        export VISUAL=$editor
        break
    fi
done

# Frequently Accessed Directories
export DOTS_DIR="$HOME/.dots"
export NVIMDIR="$XDG_CONFIG_HOME/nvim"
export KAKDIR="$XDG_CONFIG_HOME/kak"
export NOTEBOOK_DIR="$HOME/ari-common/ari_yelling"

export QMK_USERSPACE="$HOME/sources/qmk_userspace"

# XDG COMPLIANCE AAAAAAA

## Utilities #####################################################################
# Less
export LESSHISTFILE=$XDG_CACHE_HOME/less.history

# Pass
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/password-store

# Starship Prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml

## Programming ###################################################################

# Rust
export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CARGO_HOME=$XDG_DATA_HOME/cargo

# Ruby
export BUNDLE_USER_CONFIG="$XDG_CONFIG_HOME/ruby/bundle"
export BUNDLE_USER_CACHE="$XDG_CACHE_HOME/ruby/bundle"
export BUNDLE_USER_PLUGIN="$XDG_DATA_HOME/ruby/bundle"
export GEM_HOME="$XDG_DATA_HOME/ruby/gem"
export GEM_SPEC_CACHE="$XDG_CACHE_HOME/ruby/gem"

## Games #########################################################################

export NETHACKOPTIONS=$XDG_CONFIG_HOME/nethack/nethackrc

# Update PATH
pathadd $HOME/bin
pathadd $HOME/.local/bin
pathadd $CARGO_HOME/bin

