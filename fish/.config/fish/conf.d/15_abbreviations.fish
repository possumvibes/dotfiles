status is-interactive || exit

# workflow apps
abbr -a e $EDITOR

abbr -a b bat
abbr -a g git
abbr -a k kak
abbr -a t trash
abbr -a tt tree

# Config files
abbr -a aa	"cd $XDG_CONFIG_HOME/fish; $EDITOR conf.d/15_abbreviations.fish"
abbr -a AA  "cd $XDG_CONFIG_HOME/shell.d; $EDITOR 0_env.sh"
abbr -a fishconf "cd $XDG_CONFIG_HOME/fish; $EDITOR config.fish"
abbr -a zconf "cd $ZDOTDIR; kak .zshrc"
abbr -a niriconf "cd $XDG_CONFIG_HOME/niri; $EDITOR config.kdl"

# Editor config files
alias vimrc "cd $XDG_CONFIG_HOME/vim; vim vimrc"
alias kakrc "cd $XDG_CONFIG_HOME/kak; kak kakrc"

# Notes
alias notes "cd $NOTEBOOK_DIR; $EDITOR scratchpad.md"
alias note  "cd $NOTEBOOK_DIR"
alias nn "tmux new -A -s notes -c $NOTEBOOK_DIR"

abbr src "cd $REPOSDIR"
abbr -a keeb "cd $QMK_USERSPACE/users/possumvibes"

# Utilities
abbr -a md	'mkdir -p'

# Better utility defaults, as aliases
alias cp 'cp -rvi'
alias mv 'mv -i'
alias rm 'rm -I -r'

# make 'sudo rm' less dangerous
abbr -a srm 'sudo rm -i'

# Shell With Secrets In (requires pass)
abbr -a priv 'secretshell'

if command -q xbps-install
  abbr -a mup 'sudo makewhatis /usr/share/man'
  abbr -a xi 'sudo xbps-install'
  abbr -a xq 'sudo xbps-query'
end

# rescue me from myself
abbr -a ':q!' 'exit'
abbr -a ':wq' 'exit'

if command -q yt-dlp
  alias ytaud 'yt-dlp --add-metadata -ci --extract-audio -o "%(title)s.%(ext)s"'
  alias ytvid 'yt-dlp --add-metadata --no-playlist --write-description --newline -o "%(title)s.%(ext)s" '
end

