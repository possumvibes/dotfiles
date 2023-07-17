# https://github.com/caksoylar/dotfiles/blob/main/kak/autoload/inc-dec.kak
declare-user-mode math

define-command enter_math_mode %{
  enter-user-mode math -lock
}

define-command -params 3 inc-dec %{
    try %{
        evaluate-commands %sh{
            [ "$1" = 0 ] && count=1 || count="$1"
            [ "$3" = 0 ] && mult=1  || mult="<c-r>#"
            printf '%s%s\n' 'execute-keys h"_/\d<ret><a-i>na' "$2($count * $mult)<ret><esc> | bc<ret><semicolon>dh<a-i>n"
        }
    }
} -docstring %{
    inc-dec <count> <op> <sequential>: increase (op=+) or decrease (op=-) selections by either count
    (default: 1) if sequential is zero, or count times selection index otherwise
}

map global math <ret> %{_|xargs -I@ fish -Nc "builtin math '@'"<ret>} -docstring "evaluate selected math expression"
map global math a ':inc-dec %val{count} + 0<ret>' -docstring "increment by count"
map global math x ':inc-dec %val{count} - 0<ret>' -docstring "decrement by count"
map global math A ':inc-dec %val{count} + 1<ret>' -docstring "increment by count times selection index"
map global math X ':inc-dec %val{count} - 1<ret>' -docstring "decrement by count times selection index"
