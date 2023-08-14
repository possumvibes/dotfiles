# Zsh-specific aliases
#
# Dedicated config for shell-specific override aliases and
# aliases with zsh-specific features.


# Shell-specific overrides
#
sup(){
	if [ -f ~/.zshenv ]; then
  	source ~/.zshenv
	fi

	source $ZDOTDIR/.zshrc
	echo "reloaded zsh"
}

# Directory history
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index

alias aaz="cd ~/.config/shell.d; $EDITOR zsh_aliases.zsh"


