# workflow apps
alias vi='nvim'
alias vim='nvim'
alias view='nvim -R'

alias xup='xrdb -load ~/.Xresources'

# navigation and listing
alias la='ls -la'
# alias ..='cd ..'
# alias ...='cd ../..'
# alias ..='cd ..'


# dotfiles management
alias cm='chezmoi'
alias cma='chezmoi add'
alias cmc='chezmoi cd'
alias cme='chezmoi edit' 
alias cmp='chezmoi apply && echo chezmoi diff applied'

# package updates
alias uu='sudo dnf upgrade --refresh -y'
