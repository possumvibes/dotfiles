# workflow apps
abbr -a vi "nvim"
abbr -a vim "nvim"
abbr -a view "nvim -R"

# Config files
abbr -a vimrc 'nvim ~/.config/nvim/init.lua'
abbr -a aliases	'nvim $ZSH_CUSTOM/aliases.zsh'

# Reload Configs
abbr -a xup 'xrdb -load ~/.Xresources && echo "reloaded .Xresources"'
abbr -a zup 'source ~/.zshrc && echo "reloaded zshrc"'
abbr -a sup 'source $FISHCONF && echo "reloaded config.fish"'

# navigation and listing
abbr -a l.	'ls -d .* --color=auto'
abbr -a la	'ls -lah'
abbr -a ll	'ls -lh'
abbr -a md	'mkdir -p'

# dotfiles management
abbr -a cm	'chezmoi'
abbr -a cme	'chezmoi edit' 
abbr -a cmr	'~/scripts/readd_dots'

abbr -a cma	'chezmoi add'
abbr -a cmc	'chezmoi cd'
abbr -a cmp	'chezmoi apply && echo chezmoi diff applied'

# package updates
abbr -a uu	'sudo dnf upgrade --refresh -y'
