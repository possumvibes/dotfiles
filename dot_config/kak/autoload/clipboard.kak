# Clipboard Integration using OSC 5m
# From  https://github.com/alexherbo2/dotfiles/blob/e225d7da7e53dad45920ea65236d9ecf84779587/.config/kak/autoload/windowing/terminal.kak

define-command clipboard_yank_selections %{
  execute-keys 'y:edit -scratch<ret><a-R>a<ret><esc><a-_><a-|>{ printf ''\033]52;c;''; base64; printf ''\a''; } <gt> /dev/tty<ret>:delete-buffer<ret>'
}

