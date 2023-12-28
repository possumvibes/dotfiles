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
export REPOSDIR="$HOME/repos"

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
export NOTEBOOK_DIR="$HOME/common/ari_yelling"

export QMK_USERSPACE="$REPOSDIR/qmk_userspace"
export WALLPAPER_DIR="$XDG_DATA_HOME/wallpapers/"

# XDG COMPLIANCE AAAAAAA

## Utilities #####################################################################

# gnupg
export GNUPGHOME=${XDG_CONFIG_HOME}/gnupg

# ICEauthority
export ICEAUTHORITY=${XDG_CACHE_HOME}/ICEauthority

# less
export LESSHISTFILE=$XDG_CACHE_HOME/less.history
export LESSKEY="${XDG_CONFIG_HOME}/less/keys"

# pass
export PASSWORD_STORE_DIR=$XDG_DATA_HOME/password-store

# starship prompt
export STARSHIP_CONFIG=~/.config/starship/starship.toml

# vim
export VIMINIT='let $MYVIMRC="$XDG_CONFIG_HOME/vim/vimrc" | source $MYVIMRC'
export VIMDOTDIR="$XDG_CONFIG_HOME/vim"

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

