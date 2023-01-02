# workflow apps

alias e="$EDITOR"
alias er='nvim -R'

# package updates
alias uu='sudo dnf upgrade --refresh -y'

# Config files
alias vimrc='nvim ~/.config/nvim/init.lua'
alias aa='nvim ~/.bash_aliases'

# Reload Configs
alias xup='xrdb -load ~/.Xresources && echo "reloaded .Xresources"'
alias zup='source ~/.zshenv && echo reloaded profile'

# navigation and listing
alias la='ls -lah'
alias ll='ls -lh'
alias md='mkdir -p'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# chezmoi dotfiles management
alias cm='chezmoi'
alias cma='chezmoi add'
alias cmc='chezmoi cd'
alias cmr='cm-readd-dots'

### editing through chezmoi
alias cme='chezmoi edit' 
alias cmp='chezmoi apply && echo chezmoi diff applied'
