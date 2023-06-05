# Pickers for the prompt
#
# Requires: fd

define-command open_buffer_picker %{
  prompt open: -menu -buffer-completion %{
    buffer %val{text}
  }
}

define-command open_file_picker %{
  prompt open: -menu -shell-script-candidates 'fd --type=file --hidden' %{
    edit -existing %val{text}
  }
}

