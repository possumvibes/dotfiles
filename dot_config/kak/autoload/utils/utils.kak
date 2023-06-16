# Utils not yet categorized

## Files--------------------------------------
# 

# https://github.com/alexherbo2/dotfiles/blob/master/.config/kak/kakrc
define-command open_config %{
  edit "%val{config}/kakrc"
}

# https://github.com/alexherbo2/dotfiles/blob/master/.config/kak/kakrc
define-command pwd %{
  echo -markup "{Information}%sh{pwd}"
}

## Buffers-----------------------------------
#
# Creates a buffer from the given string.
# https://github.com/mawww/kakoune/blob/master/src/buffer_utils.cc#:~:text=create_buffer_from_string
define-command create_buffer_from_string -params 2 %{
  edit -scratch %arg{1}
  set-register dquote %arg{2}
  execute-keys '%R'
}

alias global buffer_str create_buffer_from_string

# Leading whitespace is removed from the string contents according to the number of whitespace in the last line before the string delimiter.
# Text enclosed in square brackets denotes selected text.
define-command create_buffer_from_template_string -params 2 %{
  create_buffer_from_string %arg{1} %arg{2}
  execute-keys '%s\A\n|\n\z<ret>d%1s(\h+)\n\z<ret>y%s^\Q<c-r>"<ret>dged%s\[<ret><a-i>ri<backspace><esc>a<del><esc>'
}

## Shell file utils--------------------------
#
#https://github.com/alexherbo2/dotfiles/blob/95ed5e5339218fe2b02105b6d192c84c938d4f69/.config/kak/autoload/utils.kak
define-command mkdir %{
  evaluate-commands %sh{
    mkdir -p -- "$(dirname -- "$kak_buffile")" ||
    printf "fail 'ERROR: mkdir exited with: %d.'" "$?"
  }
}

#https://github.com/alexherbo2/dotfiles/blob/95ed5e5339218fe2b02105b6d192c84c938d4f69/.config/kak/autoload/utils.kak
define-command tp %{
  evaluate-commands %sh{
    trash -- "$kak_buffile" ||
    printf "fail 'ERROR: rm exited with: %d.'" "$?"
  }
  delete-buffer
}

#https://github.com/alexherbo2/dotfiles/blob/95ed5e5339218fe2b02105b6d192c84c938d4f69/.config/kak/autoload/utils.kak
define-command mv -params 1 %{
  evaluate-commands %sh{
    mv -- "$kak_buffile" "$1" ||
    printf "fail 'ERROR: mv exited with: %d.'" "$?"
  }
  rename-buffer -file -- %arg{1}
}
complete-command mv file

## Misc utils

#https://github.com/alexherbo2/dotfiles/blob/95ed5e5339218fe2b02105b6d192c84c938d4f69/.config/kak/autoload/utils.kak
define-command increment_selected_numbers -params 0..1 %{
  execute-keys "a+%sh{expr $1 '|' 1}<esc>|{ cat; echo; } | bc<ret>"
}


#https://github.com/alexherbo2/dotfiles/blob/95ed5e5339218fe2b02105b6d192c84c938d4f69/.config/kak/autoload/utils.kak
define-command decrement_selected_numbers -params 0..1 %{
  execute-keys "a-%sh{expr $1 '|' 1}<esc>|{ cat; echo; } | bc<ret>"
}

# https://github.com/alexherbo2/dotfiles/blob/e225d7da7e53dad45920ea65236d9ecf84779587/.config/kak/autoload/windowing/terminal.kak
define-command yank_selected_text_to_clipboard %{
  execute-keys 'y:edit -scratch<ret><a-R>a<ret><esc><a-_><a-|>{ printf ''\033]52;c;''; base64; printf ''\a''; } <gt> /dev/tty<ret>:delete-buffer<ret>'
}

