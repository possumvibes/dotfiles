#!/usr/bin/env zsh
#
# Once $ZDOTDIR is set, zsh will look for this file at $ZDOTDIR/.zshenv,
# causing this file only to be read on initial system entry.

export ZDOTDIR=~/.config/zsh
source $ZDOTDIR/.zshenv

