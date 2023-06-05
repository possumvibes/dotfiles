# https://github.com/Delapouite/kakoune-user-modes/blob/master/user-modes.kak

declare-user-mode format

define-command enter_format_mode %{
  enter-user-mode format
}

map global format j '<esc>`'                          -docstring '↓ lowercase'
map global format k '<esc>~'                          -docstring '↑ uppercase'
map global format s '<esc><a-`>'                      -docstring '↕ switchcase'
map global format f ': format<ret>'                   -docstring 'format'
map global format c ': comment-line<ret>'             -docstring 'comment-line'
map global format C ': comment-block<ret>'            -docstring 'comment-block'
map global format t ': set global indentwidth 0<ret>' -docstring 'indent tab'
map global format 2 ': set global indentwidth 2<ret>' -docstring 'indent space 2'
map global format 4 ': set global indentwidth 4<ret>' -docstring 'indent space 4'
