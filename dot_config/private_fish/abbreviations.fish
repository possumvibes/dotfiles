# workflow apps
abbr -a e $EDITOR
abbr -a vi "nvim"
abbr -a vim "nvim"
abbr -a view "nvim -R"

# package updates
abbr -a uu	'sudo dnf upgrade --refresh -y'

# Config files
abbr -a vimrc 'nvim ~/.config/nvim/init.lua'
abbr -a aa	'nvim $FSHDIR/abbreviations.fish'

# Reload Configs
abbr -a xup 'xrdb -load ~/.Xresources && echo "reloaded .Xresources"'
abbr -a sup 'source $FSHDIR/config.fish && echo reloaded config.fish'

# navigation and listing
abbr -a l.	'ls -d .* --color=auto'
abbr -a la	'ls -lah'
abbr -a ll	'ls -lh'
abbr -a md	'mkdir -p'

# chezmoi dotfiles management
abbr -a cm	'chezmoi'
abbr -a cma	'chezmoi add'
abbr -a cmc	'chezmoi cd'
abbr -a cmr	'~/scripts/readd_dots'

### editing through chezmoi
abbr -a cme	'chezmoi edit' 
abbr -a cmp	'chezmoi apply && echo chezmoi diff applied'

