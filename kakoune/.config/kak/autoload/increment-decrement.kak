# Auto-increment/decrement selection

#https://github.com/alexherbo2/dotfiles/blob/95ed5e5339218fe2b02105b6d192c84c938d4f69/.config/kak/autoload/utils.kak
define-command increment_selected_numbers -params 0..1 %{
    execute-keys "a+%sh{expr $1 '|' 1}<esc>|{ cat; echo; } | bc<ret>"
}


#https://github.com/alexherbo2/dotfiles/blob/95ed5e5339218fe2b02105b6d192c84c938d4f69/.config/kak/autoload/utils.kak
define-command decrement_selected_numbers -params 0..1 %{
    execute-keys "a-%sh{expr $1 '|' 1}<esc>|{ cat; echo; } | bc<ret>"
}


