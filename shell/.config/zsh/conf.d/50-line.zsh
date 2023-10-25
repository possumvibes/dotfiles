#######################################################################
# Possum's Dotfiles -- Zsh -- Line Editing
# https://github.com/possumvibes/dotfiles
#######################################################################

# Treat these characters as part of a word.
WORDCHARS='_-*?[]~&.;!#$%^(){}<>' 

# Allow combining quotes to escape ('ty''s ties' rather than 'ty'\''s ties')
setopt rc_quotes

# Fix slow one-by-one character pasting when bracketed-paste-magic is on. See
# zsh-users/zsh-syntax-highlighting#295
zstyle ':bracketed-paste-magic' active-widgets '.self-*'

# Plugin line behavior: autopairing and better vim
ZVM_VI_SURROUND_BINDKEY="s-prefix"
autopair-init
