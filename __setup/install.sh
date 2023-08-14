#!/bin/bash
#

# Headless Install files ----------------------------
#

# KAKOUNE
ln -s $(readlink -f $(dirname (pwd)))/kak ~/.config/kak
ln -s $(readlink -f "$(dirname $(type -p kak))"/../share/kak/autoload) ~/.config/kak/autoload/standard-library

## Install kak-bundle package manager
mkdir -p ~/.config/kak/bundle
git clone https://github.com/jdugan6240/kak-bundle ~/.config/kak/bundle/kak-bundle

# NVIM
ln -s $(readlink -f $(dirname $(pwd)))/nvim ~/.config/nvim

# BAT
ln -s $(readlink -f $(dirname $(pwd)))/bat ~/.config/bat

# GIT
ln -s $(readlink -f $(dirname $(pwd)))/git ~/.config/git

# HELIX
ln -s $(readlink -f $(dirname $(pwd)))/helix ~/.config/helix

# FISH
ln -s $(readlink -f $(dirname $(pwd)))/fish ~/.config/fish

# STARSHIP
ln -s $(readlink -f $(dirname $(pwd)))/starship ~/.config/starship

# TMUX
ln -s $(readlink -f $(dirname $(pwd)))/tmux ~/.config/tmux

# VIM
ln -s $(readlink -f $(dirname $(pwd)))/.vimrc ~/.vimrc

# BIN
ln -s $(readlink -f $(dirname $(pwd)))/bin ~/bin
