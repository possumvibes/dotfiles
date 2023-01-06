# workflow apps

alias e="$EDITOR"
alias er="$EDITOR -R"

alias b='bat'

# package updates
alias uu='sudo dnf upgrade --refresh -y'

# Config files
alias vimrc='nvim ~/.config/nvim/init.lua'
alias aa="nvim $ZDOTDIR/conf.d/aliases.zsh"

# Reload Configs
alias xup='xrdb -load ~/.Xresources && echo "reloaded .Xresources"'
alias zup="source ~/.zshenv && source $ZDOTDIR/.zshrc && echo reloaded profile"

# navigation and listing
alias la='ls -lah'
alias ll='ls -lh'
alias md='mkdir -p'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Directory history
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

# chezmoi dotfiles management
alias cm='chezmoi'
alias cma='chezmoi add'
alias cmc='chezmoi cd'
alias cmr='cm-readd-dots'

### editing through chezmoi
alias cme='chezmoi edit' 
alias cmp='chezmoi -R apply && echo chezmoi diff applied, externals reloaded'
