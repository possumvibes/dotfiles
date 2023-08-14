# Source the common environment, which includes the PATH
if [ -z "$ZSHENV_SOURCED" ]; then
  echo "something is awry: sourcing ZDOTDIR/zshenv"
  . $ZDOTDIR/.zshenv
fi

# Source common aliases
. ~/.config/shell.d/aliases.sh

# Source additional customizations
if [ -d $ZDOTDIR/conf.d ]; then
  for i in $ZDOTDIR/conf.d/*.zsh; do
    source "$i"
  done
fi

# Source my completions
if [[ -d $ZDOTDIR/completions ]]; then
  fpath=($ZDOTDIR/completions $fpath)
fi

# Source plugins: manually managed.
# This includes plugin git repos and package-manager-installed programs.
[ -f $ZDOTDIR/plugins.zsh ] && source $ZDOTDIR/plugins.zsh

# Autoload
autoload -U zmv # One day I will get rid of all the Windows "Capitalized And Spaced" names

# Settings
setopt notify
setopt NO_beep          # pls do not beep :(

# History
HISTFILE=$ZSH_DATA_DIR/zsh_history
HISTSIZE=1000
SAVEHIST=1000
setopt extended_history          # Include start time in history records
setopt append_history            # Appends history to history file on exit
setopt inc_append_history        # Write to the history file immediately, not when the shell exits.
setopt share_history             # Share history between all sessions.
setopt hist_expire_dups_first    # Expire a duplicate event first when trimming history.
setopt hist_ignore_dups          # Do not record an event that was just recorded again.
setopt hist_ignore_all_dups      # Remove old events if new event is a duplicate
setopt hist_ignore_space         # Do not record an event starting with a space.
setopt hist_save_no_dups         # Do not write a duplicate event to the history file.
setopt hist_reduce_blanks        # Minimize unnecessary whitespace
setopt hist_verify               # Do not execute immediately upon history expansion.
setopt hist_beep                 # Beep when accessing non-existent history.

# Directory
DIRSTACKSIZE=9
setopt auto_cd            # Implicit CD slows down plugins
setopt cdable_vars          # Change directory to a path stored in a variable.
setopt extended_glob        # Use extended globbing syntax.
setopt auto_pushd           # Push the old directory onto the stack on cd.
setopt pushd_ignore_dups    # Do not store duplicates in the stack.
setopt pushd_silent         # Do not print the directory stack after pushd or popd.
setopt pushd_to_home        # Push to home directory when no argument is given.

# Completion
zmodload zsh/complist       # Enable completion menu-specific keybindings
autoload -Uz compinit       # Load zsh completion
compinit;                   # Enable completion after sourcing all completions

_comp_options+=(globdots)   # Include hidden files in completions
setopt always_to_end        # Move cursor to the end of a completed word.
setopt auto_menu            # Show completion menu on a successive tab press.
setopt auto_param_slash     # If completed parameter is a directory, add a trailing slash.
setopt complete_in_word     # Complete from both ends of a word.
setopt NO_case_glob 	      # Globbing should not be case sensitive.
setopt NO_complete_aliases  # Don't treat aliases as full completions. (Do use the expansion for completion).
setopt NO_flow_control      # Disable start/stop characters in shell editor.
setopt NO_menu_complete     # Do not autoselect the first completion entry.
setopt path_dirs            # Perform path search even on command names with slashes.

# Keybindings
bindkey -v
## Readline-ish <c-a/e>
bindkey '^A' beginning-of-line
bindkey '^E' end-of-line

export KEYTIMEOUT=1         # Faster mode switch between insert and normal modes
# todo: menuselect bindings (enabled with complist)


# Prompt
setopt prompt_subst        # allow prompt substring to support vcs-info
source $ZDOTDIR/theming/prompt.zsh
