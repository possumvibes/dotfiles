status is-interactive || exit

# Abbreviations provide shorthands for commands I use frequently and don't want to 
# type fully. For commands with flags I don't like typing, this has the advantage of 
# showing me the command in full before I execute it, which keeps me from forgetting 
# commands even when I don't type them fully for years!
# 
# Aliases provide better defaults for commands I use regularly (like colored 
# output!) and provide me a handy way to override functions without losing their 
# automatic completion. 

# workflow apps
abbr -a e $EDITOR

abbr -a lg lazygit
abbr -a t trash
abbr  tt tree

# Better ls-ing
if command -q eza
  alias ls 'eza --git --icons --group-directories-first'
  alias ll 'ls -lb'
  abbr tt 'ls -T'
else
  alias ls 'ls --color=auto --group-directories-first -pv'
  alias ll 'ls -lh'
end
alias la 'll -a'
alias l 'ls -1'

# Better utility defaults, as aliases
alias cp 'cp -rvi'
alias mv 'mv -i'
alias rm 'rm -I -r'
abbr -a srm 'sudo rm -i'

# Colored output
alias dir 'dir --color=auto'
alias vdir 'vdir --color=auto'
alias grep 'grep --color=auto'
alias fgrep 'fgrep --color=auto'
alias egrep 'egrep --color=auto'
alias tree 'tree -C'

# Convenience Utilities
abbr -a md	'mkdir -p'
abbr -a ':q!' 'exit'
abbr -a ':wq' 'exit'

# Shell With Secrets In (requires pass)
abbr -a priv 'secretshell'

# Edit Config files
abbr -a aa	"cd $XDG_CONFIG_HOME/fish; $EDITOR conf.d/10_aliases.fish"
abbr -a AA  "cd $XDG_CONFIG_HOME/shell.d; $EDITOR 0_env.sh"
abbr -a fishconf "cd $XDG_CONFIG_HOME/fish; $EDITOR config.fish"
abbr -a zconf "cd $ZDOTDIR; kak rc.zsh"
abbr -a niriconf "cd $XDG_CONFIG_HOME/niri; $EDITOR config.kdl"

# Editor config files
alias vimrc "cd $XDG_CONFIG_HOME/vim; $EDITOR vimrc"
alias kakrc "cd $XDG_CONFIG_HOME/kak; $EDITOR kakrc"

# Notes
alias notes "cd $NOTEBOOK_DIR; $EDITOR scratchpad.md"
alias note  "cd $NOTEBOOK_DIR"
alias nn "tmux new -A -s notes -c $NOTEBOOK_DIR"

# Coding/Keyboard
abbr -a src "cd $REPOSDIR"
abbr -a keeb "cd $QMK_USERSPACE/users/possumvibes"

# My Programs #myprograms
if command -q xbps-install
  abbr -a mup 'sudo makewhatis /usr/share/man'
  abbr -a xi 'sudo xbps-install'
  abbr -a xq 'sudo xbps-query'
  abbr -a xr 'sudo xbps-remove'
end

if command -q yt-dlp
  alias ytaud 'yt-dlp --add-metadata -ci --extract-audio -o "%(title)s.%(ext)s"'
  alias ytvid 'yt-dlp --add-metadata --no-playlist --write-description --newline -o "%(title)s.%(ext)s"'
end

if command -q fastfetch
  abbr -a huh fastfetch
end
