# .bashrc

# Source global definitions
if [ -f /etc/bashrc ]; then
	. /etc/bashrc
fi

# User specific environment
if [ -f ~/.config/shell.d/0_env.sh ]; then
	. ~/.config/shell.d/0_env.sh
fi

# Use XDG-compliant history file location
HISTFILE=~/.local/share/bash/bash_history

# Don't put duplicate lines or lines starting with space in the history.
# See `man bash` for more options.
HISTCONTROL=ignoreboth

# Append to the history file, don't overwrite it.
shopt -s histappend

# Limit history scope
HISTFILESIZE=100

# Source common aliases
if [ -f ~/.config/shell.d/aliases.sh ]; then
	. ~/.config/shell.d/aliases.sh
fi

if [ -d ~/.config/shell.d/bash ]; then
	for i in ~/.config/shell.d/bash/*.bash; do
    	. "$i"
	done
fi

## fzf for completion
[ -f /usr/share/fzf/shell/key-bindings.bash ] && . /usr/share/fzf/shell/key-bindings.bash


