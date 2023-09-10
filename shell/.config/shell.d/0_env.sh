#!/bin/sh
#
# Common environment for POSIX-compliant shells

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
export DOTS_DIR="$XDG_DATA_HOME/dotfiles"
export STOWDIR="~/.dots"
export NVIMDIR="$XDG_CONFIG_HOME/nvim"
export KAKDIR="$XDG_CONFIG_HOME/kak"
export NOTEBOOK_DIR="$HOME/ari-common/ari_yelling"

export QMK_USERSPACE="$HOME/sources/qmk_userspace"

# XDG COMPLIANCE AAAAAAA
export STARSHIP_CONFIG=~/.config/starship/starship.toml
export NETHACKOPTIONS=$XDG_CONFIG_HOME/nethack/nethackrc

export RUSTUP_HOME=$XDG_DATA_HOME/rustup
export CARGO_HOME=$XDG_DATA_HOME/cargo
export LESSHISTFILE=$XDG_CACHE_HOME/less.history
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/password-store

# Update PATH
pathadd $HOME/bin
pathadd $HOME/.local/bin
pathadd $CARGO_HOME/bin

