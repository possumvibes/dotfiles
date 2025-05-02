
# Defines a command to search the kak docs!
define-command -override search-doc -params 1 %{
  prompt -menu search: -shell-script-candidates "grep -e ""%arg{1}"" -R %val{runtime}/doc" %{
    info "thing is %val{text}"
  }
}

