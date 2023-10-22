#!/usr/bin/env zsh

# Source the common environment, which includes the PATH
if [ -z "$ZSHENV_SOURCED" ]; then
  echo "something is awry: sourcing ZDOTDIR/zshenv"
  . $ZDOTDIR/.zshenv
fi

# Load config files.
if [ -d $ZDOTDIR/conf.d ]; then
  for i in $ZDOTDIR/conf.d/*.zsh; do
    source "$i"
  done
fi

# Autoload the functions.
fpath=($ZDOTDIR/functions $fpath)
autoload -Uz -- $fpath[1]/*(.:t)

# Source common aliases.
[ -f $XDG_CONFIG_HOME/shell.d/aliases.sh ] && . $XDG_CONFIG_HOME/shell.d/aliases.sh

## Settings not otherwise stored ##############################################

# pls do not beep :(
setopt NO_beep

# Jobs
setopt auto_resume     # Attempt to resume existing jobs before creating a new process.
setopt long_list_jobs  # List jobs in the long format by default


## Widgets ###################################################################

# Convenient file renaming, if I ever remember to use it
autoload -U zmv
