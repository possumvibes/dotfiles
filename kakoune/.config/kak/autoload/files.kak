## Files--------------------------------------
#
# Commands to manage current directory, buffer directory, facilitate saving, and more!
# Drawn from alexherbo2's kak dots:
# https://github.com/alexherbo2/dotfiles/blob/master/.config/kak/kakrc
# https://github.com/alexherbo2/dotfiles/blob/95ed5e5339218fe2b02105b6d192c84c938d4f69/.config/kak/autoload/utils.kak


# Quick kakrc access
define-command open_config %{
    edit "%val{config}/kakrc"
}

# Get current working directory
define-command pwd %{
    echo -markup "{Information}%sh{pwd}"
}

# create a directory at current buffer's path
define-command mkdir %{
    evaluate-commands %sh{
        mkdir -p -- "$(dirname -- "$kak_buffile")" ||
        printf "fail 'ERROR: mkdir exited with: %d.'" "$?"
    }
}

# move current file (and rename buffer)
define-command mv -params 1 %{
    evaluate-commands %sh{
        mv -- "$kak_buffile" "$1" ||
        printf "fail 'ERROR: mv exited with: %d.'" "$?"
    }
    rename-buffer -file -- %arg{1}
}
complete-command mv file

# trash current file (and delete the buffer)
define-command tp %{
    evaluate-commands %sh{
        trash -- "$kak_buffile" ||
        printf "fail 'ERROR: rm exited with: %d.'" "$?"
    }
    delete-buffer
}

