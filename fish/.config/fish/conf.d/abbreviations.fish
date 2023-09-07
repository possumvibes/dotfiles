status is-interactive || exit

# workflow apps
abbr -a e $EDITOR
abbr -a b bat
abbr -a k kak
abbr -a t trash

# Config files
abbr -a aa	"cd $XDG_CONFIG_HOME/fish; kak conf.d/abbreviations.fish"
abbr -a fishconf "cd $XDG_CONFIG_HOME/fish; kak config.fish"
abbr -a zconf "cd $ZDOTDIR; kak .zshrc"

# Editor config files
abbr -a vimrc "cd $XDG_CONFIG_HOME/nvim; nvim init.lua"
abbr -a kakrc "cd $XDG_CONFIG_HOME/kak; kak kakrc"

# Notes
abbr -a notes "cd $NOTEBOOK_DIR; $EDITOR scratchpad.md"
abbr -a note  "cd $NOTEBOOK_DIR"

# Utilities
abbr -a md	'mkdir -p'
abbr -a rm  'rm -i'

# Config Management
abbr -a cmc	"cd $STOWDIR" #config-management cd

# Shell With Secrets In (requires pass)
abbr -a priv 'secretshell'

