# Wiki navigation

# Default location for the wiki's relative paths.
declare-option str wikinotes_wiki_root '~/wiki'

# matches inline links, with $1 link text and $2 link path
declare-option -hidden str wikinotes_link_mdinline '\[([^\[\n]+)\(([^\(\n]+)[^\n]*\)'

## LINK NAVIGATION

# TODO: extract the common bits here
define-command wikinotes-select-next-link %{
  evaluate-commands -no-hooks -save-regs / %{
    set-register / "%opt{wikinotes_link_mdinline}"
    execute-keys "<n>"
  }  
}

define-command wikinotes-select-prev-link %{
  evaluate-commands -no-hooks -save-regs / %{
    set-register / "%opt{wikinotes_link_mdinline}"
    execute-keys "<a-n>"
  }
}

define-command wikinotes-open-link %{
  evaluate-commands -draft -save-regs a %{
    try %{
      execute-keys s\[([^\[\n]+)\(([^\(\n]+)\)<ret>
    } catch %{
      fail No link found.
    }

    # We have the full link syntax.
    # Next, select only the path
    
  }
}
