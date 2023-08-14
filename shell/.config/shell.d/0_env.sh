#!/bin/sh
#
# Common environment for POSIX-compliant shells

### XDG Base Directories
export XDG_CACHE_HOME="$HOME/.cache"
export XDG_CONFIG_HOME="$HOME/.config"
export XDG_DATA_HOME="$HOME/.local/share"
export XDG_BIN_HOME="$HOME/.local/bin"

export ZDOTDIR=$XDG_CONFIG_HOME/zsh

# Editor
export EDITOR="kak"
export VISUAL="kak"

# Frequently Accessed Directories
export DOTS_DIR="$XDG_DATA_HOME/chezmoi"
export STOWDIR="~/.dots"
export NVIMDIR="$XDG_CONFIG_HOME/nvim"
export KAKDIR="$XDG_CONFIG_HOME/kak"
export NOTEBOOK_DIR="$HOME/ari-common/ari_yelling"

export STARSHIP_CONFIG=~/.config/starship/starship.toml

# Adds a directory to PATH if it exists and is not already present in PATH
pathadd() {
  if [ -d "$1" ] && [[ ! $PATH =~ (^|:)$1(:|$) ]]; then
    PATH="${1}:$PATH"
  fi
}

pathadd $HOME/bin
pathadd $HOME/.local/bin
pathadd $HOME/.cargo/bin

