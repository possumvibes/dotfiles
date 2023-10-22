#######################################################################
# Possum's Dotfiles -- Zsh -- Key Bindings
# https://github.com/possumvibes/dotfiles
#######################################################################

bindkey -v

# <key>  <action>
readonly -A key=(
	# Movement
	khome  beginning-of-line
	kend   end-of-line
	kLFT   vi-backward-blank-word
	kLFT3  backward-word
	kLFT5  backward-word
	kRIT   vi-forward-blank-word
	kRIT3  forward-word
	kRIT5  forward-word

	# Editing
	kbs    backward-delete-char
	kdch1  delete-char
	kich1  overwrite-mode

	# History
	kcuu1  up-line-or-beginning-search
	kcud1  down-line-or-beginning-search
	kpp    beginning-of-buffer-or-history
	knp    end-of-buffer-or-history
)

## Widgets #######################################################################

autoload -Uz \
	up-line-or-beginning-search \
	down-line-or-beginning-search

zle -N up-line-or-beginning-search
zle -N down-line-or-beginning-search

autoload -Uz edit-command-line
zle -N edit-command-line

## Bind Processing ##############################################################

for kcode kfunc in ${(kv)key}; do
	bindkey -- ${terminfo[$kcode]:-$kcode} $kfunc
done

# Make sure the terminal is in application mode ...whatever that is.
# Otherwise the `terminfo` codes don't work.
if (( ${+terminfo[smkx]} && ${+terminfo[rmkx]} )); then
	autoload -Uz add-zle-hook-widget

	_zle-app-mode-start() { echoti smkx }
	_zle-app-mode-stop()  { echoti rmkx }

	add-zle-hook-widget -Uz zle-line-init   _zle-app-mode-start
	add-zle-hook-widget -Uz zle-line-finish _zle-app-mode-stop
fi

