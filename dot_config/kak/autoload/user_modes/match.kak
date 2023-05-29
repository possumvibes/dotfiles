# From https://github.com/alexherbo2/dotfiles/blob/master/.config/kak/autoload/user_modes/match.kak
declare-user-mode match

define-command enter_match_mode %{
    enter-user-mode match
}

map -docstring 'select next matching brackets' global match m m
map -docstring 'select previous matching brackets' global match p <a-m>
map -docstring 'select inner surrounding objects' global match i <a-i>
map -docstring 'select whole surrounding objects' global match a <a-a>
}
