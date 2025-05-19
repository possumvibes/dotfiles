#!/usr/bin/env zsh

# zsh's .profile
# sourced at login when zsh is the login shell

# In order to ensure ssh-agent is started the same for zsh as for bash, 
# source ~/.profile in sh emulation.

emulate sh
	. ~/.profile
emulate zsh

