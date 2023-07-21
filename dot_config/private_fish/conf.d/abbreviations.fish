# workflow apps
abbr -a e   $EDITOR
abbr -a b bat
abbr -a k kak

# Config files
abbr -a aa	"$EDITOR $FSHDIR/conf.d/abbreviations.fish"
abbr -a vimrc "cd $XDG_CONFIG_HOME/nvim; nvim init.lua"
abbr -a kakrc "cd $XDG_CONFIG_HOME/kak; kak kakrc"
abbr -a fishconf "cd $XDG_CONFIG_HOME/fish; kak config.fish"

# Utilities
abbr -a md	'mkdir -p'
abbr -a rm  'rm -i'
abbr -a t   'trash'

# zoom
abbr -a notes "cd $NOTEBOOK_DIR; $EDITOR scratchpad.md"

# chezmoi dotfiles management
abbr -a cma	'cm add'
abbr -a cmc	"cd $DOTS_DIR"
abbr -a cmr	'cm-readd-dots'

### editing through chezmoi
abbr -a cme	'chezmoi edit' 
abbr -a cmp	'chezmoi -R apply && echo chezmoi diff applied, externals reloaded'

