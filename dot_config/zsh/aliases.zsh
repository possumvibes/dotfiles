# workflow apps
alias vi='nvim'
alias vim='nvim'
alias view='nvim -R'

# Nvim init.lua
alias vimrc='nvim ~/.config/nvim/init.lua'

# Reload Configs
alias xup='xrdb -load ~/.Xresources "reloaded .Xresources"'
alias zup='source ~/.zshrc && echo "reloaded zshrc"'

# navigation and listing
alias ...=../..
alias ....=../../..
alias .....=../../../..
alias ......=../../../../..
 
alias l.='ls -d .* --color=auto'
alias la='ls -lah'
alias ll='ls -lh'
alias md='mkdir -p'

# dotfiles management
alias cm='chezmoi'
alias cme='chezmoi edit' 
alias cmr='~/scripts/readd_dots'

alias cma='chezmoi add'
alias cmc='chezmoi cd'
alias cmp='chezmoi apply && echo chezmoi diff applied'

# package updates
alias uu='sudo dnf upgrade --refresh -y'
