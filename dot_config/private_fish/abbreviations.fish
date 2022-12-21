# workflow apps
abbr -a e $EDITOR
abbr -a er "$EDITOR -R"

# Config files
abbr -a vimrc 'nvim ~/.config/nvim/init.lua'
abbr -a aa	'nvim $FSHDIR/abbreviations.fish'

abbr -a md	'mkdir -p'

# chezmoi dotfiles management
abbr -a cma	'cm add'
abbr -a cmc	'cm cd'
abbr -a cmr	'cm-readd-dots'

### editing through chezmoi
abbr -a cme	'chezmoi edit' 
abbr -a cmp	'cm apply && echo chezmoi diff applied'


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
