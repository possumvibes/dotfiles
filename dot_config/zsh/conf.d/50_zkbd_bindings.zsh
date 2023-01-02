####################################
####  Keybinding Configurations ####
####################################
#
# Line-editor mode
bindkey -e

## Urxvt bindings
bindkey "^[Od" backward-word
bindkey "^[Oc" forward-word
bindkey "^[[7~" beginning-of-line
bindkey "^[[8~" end-of-line
bindkey '^[[3^' delete-word

## Alacritty, Xterm, Konsole, equivalents
bindkey '^[[1;5D' backward-word
bindkey '^[[1;5C' forward-word
bindkey "^[[H" beginning-of-line
bindkey "^[[F" end-of-line
bindkey '^[[3;5~' delete-word
# end-of-line beginning-of-line delete-word delete-char

## All
#
bindkey '^[[3~' delete-char

# zsh-history-substring-search bindings
bindkey "^[Oa" history-substring-search-up
bindkey "^[Ob" history-substring-search-down
bindkey -M emacs '^P' history-substring-search-up
bindkey -M emacs '^N' history-substring-search-down

