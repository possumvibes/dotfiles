pluginsdir=$ZSH_DATA_DIR/plugins

[ -d $pluginsdir ] || mkdir -p $pluginsdir

# zsh-users/zsh-completions
pdir=$pluginsdir/zsh-users_zsh-completions
if [ ! -d $pdir ]; then
  echo "installing zsh-users/zsh-completions"
  git clone https://github.com/zsh-users/zsh-completions.git $pdir
fi
[ -d $pdir ] && fpath=($pdir/src $fpath)
unset pdir


# hlissner/zsh-autopair
pdir=$pluginsdir/hlissner_zsh-autopair
if [ ! -d $pdir ]; then
  echo "installing hlissner/zsh-autopair"
  git clone https://github.com/hlissner/zsh-autopair.git $pdir
fi
[ -d $pdir ] && source $pdir/autopair.zsh
unset pdir

# Source fzf completion and bindings if present
if [ -x "$(command -v fzf)" ]; then
 ## Fedora automatically loads completion
 source /usr/share/fzf/shell/key-bindings.zsh

 source ~/.config/fzf/fzfrc
fi

# zdharma-continuum/fast-syntax-highlighting
pdir=$pluginsdir/zdharma-continuum_fast-syntax-highlighting
if [ ! -d $pdir ]; then
  echo "installing zdharma-continuum/fast-syntax-highlighting"
  git clone https://github.com/zdharma-continuum/fast-syntax-highlighting.git $pdir
fi
[ -d $pdir ] && source $pdir/fast-syntax-highlighting.plugin.zsh
unset pdir

# zsh-users/zsh-syntax-highlighting
# Load syntax highlighting last
# source /usr/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh
