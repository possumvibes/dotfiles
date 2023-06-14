# workflow apps
abbr -a e   $EDITOR
abbr -a er "$EDITOR -R"
abbr -a b bat
abbr -a k kak

# Config files
abbr -a aa	"nvim $FSHDIR/abbreviations.fish"
abbr -a vimrc "cd $XDG_CONFIG_HOME/nvim; nvim init.lua"
abbr -a kakrc "cd $XDG_CONFIG_HOME/kak; kak kakrc"

# Utilities
abbr -a md	'mkdir -p'
abbr -a rm  'rm -i'
abbr -a t   'trash'

# zoom
abbr -a notes "cd $NOTEBOOK_DIR; nvim scratchpad.md"

# chezmoi dotfiles management
abbr -a cma	'cm add'
abbr -a cmc	"cd $DOTS_DIR"
abbr -a cmr	'cm-readd-dots'

### editing through chezmoi
abbr -a cme	'chezmoi edit' 
abbr -a cmp	'chezmoi -R apply && echo chezmoi diff applied, externals reloaded'


###########
# Aliases added via alias --save

# package updates
#alias uu	'sudo dnf upgrade --refresh -y'

# Reload Configs
#alias xup 'xrdb -load ~/.Xresources && echo "reloaded .Xresources"'
#alias sup 'source $FSHDIR/config.fish && echo reloaded config.fish'

# navigation and listing
#alias la	'ls -lah'
#alias ll	'ls -lh'

#alias cm	'chezmoi'
