#######################################################################
# Possum's Dotfiles -- Zsh -- History Settings
# https://github.com/possumvibes/dotfiles
#######################################################################

# History
HISTFILE=$ZSH_DATA_DIR/zsh_history
HISTSIZE=10000
SAVEHIST=${HISTSIZE}

setopt extended_history          # Include start time in history records

# Share history across multiple terminals.
setopt append_history            # Appends history to history file on exit
setopt hist_fcntl_lock
setopt inc_append_history        # Write to the history file immediately, not when the shell exits.
setopt share_history             # Share history between all sessions.

# Absolutely No Dupes Allowed *bangs gavel*
setopt hist_expire_dups_first    # Expire a duplicate event first when trimming history.
setopt hist_find_no_dups
setopt hist_ignore_all_dups      # Remove old events if new event is a duplicate
setopt hist_ignore_dups          # Do not record an event that was just recorded again.
setopt hist_save_no_dups         # Do not write a duplicate event to the history file.

# Keep unhelpful things out of the history file
setopt hist_ignore_space         # Do not record an event starting with a space.
setopt hist_no_functions
setopt hist_no_store
setopt hist_reduce_blanks        # Minimize unnecessary whitespace

# Jury's still out on whether I like these
setopt hist_beep                 # Beep when accessing non-existent history.
setopt hist_verify               # Do not execute immediately upon history expansion.


