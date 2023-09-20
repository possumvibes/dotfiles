## Files--------------------------------------
#

define-command pwd %{ echo -markup "{Information}%sh{pwd}" } -docstring "print current working directory"


# Filesystem commands (with buffer side effects)
# ----------------------------------------------

define-command mkdir %{ nop %sh{ mkdir -p $(dirname $kak_buffile) } } -docstring "mkdir -p this buffer"

define-command mv -params 1 %{
    evaluate-commands %sh{
        mv -- "$kak_buffile" "$1" ||
        printf "fail 'ERROR: mv exited with: %d.'" "$?"
    }
    rename-buffer -file -- %arg{1}
} -docstring "move current file and rename buffer"

complete-command mv file

define-command trash %{
    evaluate-commands %sh{
        trash -- "$kak_buffile" ||
        printf "fail 'ERROR: trash exited with: %d.'" "$?"
    }
    delete-buffer
} -docstring "trash current file and delete the buffer. requires trash"


# Buffer management
# -----------------

define-command delete-buffers-matching -params 1 %{
    evaluate-commands -buffer * %{
        evaluate-commands %sh{ case "$kak_buffile" in $1) echo "delete-buffer" ;; esac }
    }
} -docstring "deletes buffers matching input."

define-command open-buffer-picker %{
    prompt open: -menu -buffer-completion %{
        buffer %val{text}
    }
} -docstring "open a fuzzy buffer picker."

define-command open-file-picker %{
    prompt open: -menu -shell-script-candidates 'fd --type=file --hidden' %{
        edit -existing %val{text}
    }
} -docstring "open a fuzzy file picker. requires fd."


