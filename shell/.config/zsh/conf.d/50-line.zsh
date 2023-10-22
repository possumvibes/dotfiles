#######################################################################
# Possum's Dotfiles -- Zsh -- Prompt & Line Editing
# https://github.com/possumvibes/dotfiles
#######################################################################

# Enable version control information
setopt prompt_subst

# I'm sure there's a cleaner way to actually handle enabling the prompt itself,
# presumably with promptinit
source $ZDOTDIR/theming/prompt.zsh

# Remove space after the right prompt.
ZLE_RPROMPT_INDENT=0


## Line edits ##########################################################

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
