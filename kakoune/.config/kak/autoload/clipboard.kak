# Clipboard Integration using OSC 52
# From https://github.com/alexherbo2/dotfiles/blob/e225d7da7e53dad45920ea65236d9ecf84779587/.config/kak/autoload/windowing/terminal.kak

define-command clipboard_yank_selections %{
  execute-keys 'y:edit -scratch<ret><a-R>a<ret><esc><a-_><a-|>{ printf ''\033]52;c;''; base64; printf ''\a''; } <gt> /dev/tty<ret>:delete-buffer<ret>'
}

# Clipboard Sync integration using OSC52
# From https://github.com/caksoylar/dotfiles/blob/bed3ea1b1920f769553d87870f74ed3b3f0ddf23/kak/autoload/clipboard.kak
define-command -hidden clipboard-sync \
-docstring "yank selection to terminal clipboard using OSC 52" %{
    nop %sh{
        eval set -- "$kak_quoted_selections"
        copy=$1
        shift
        for sel; do
            copy=$(printf '%s\n%s' "$copy" "$sel")
        done
        encoded=$(printf %s "$copy" | base64 | tr -d '\n')

        printf "\e]52;;%s\e\\" "$encoded" >"/proc/$kak_client_pid/fd/0"
    }
}
