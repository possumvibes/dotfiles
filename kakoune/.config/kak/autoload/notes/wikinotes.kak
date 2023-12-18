# Wiki navigation

# Default location for the wiki's relative paths.
declare-option str wikinotes_wiki_root '~/wiki'

# matches inline links, with $1 link text and $2 link path
declare-option -hidden str wikinotes_link_mdinline '\[([^\[\n]+)\(([^\(\n]+)[^\n]*\)'

# History path for ease of going back
declare-option -hidden str wikinotes_history

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

define-command wikinotes-go-url %{
  # it's a url! Ask permission to open it in the default program.
  # echo url. prompt open LINK ?. on y/Y/yes, xdg-open
}

define-command wikinotes-process-link %{
  evaluate-commands -no-hooks -save-regs a %{

    ## Get the link path
    try %{
      # 1. Check if a link is selected
      execute-keys -draft s\[([^\[\n]+)\(([^\(\n]+)\)<ret>
      execute-keys -draft <a-i>b_
      # Success: It's a link, and we've selected the linkpath.

      try %{
        # 1.1. Attempt to handle as URL
        execute-keys -draft shttp[s]?://
        wikinotes-go-url
# 
      } catch %{
        # 1.2. Handle as filepath
        # It's a filepath! edit it. 
        edit %val{selection}
      }
    } catch %{
      # 2. Selection is not a link

      try %{
        # 2.1. Check for bare URL
        execute-keys _shttp[s]?://[^\n]<ret>
        wikinotes-go-url
      } catch %{
        # 2.2. Unlinked selection! Add a link.
        # escape the selection into a valid username: replace <space> with <minus>, allow only [a-z0-9-_]
        execute-keys -draft '`s\s+<ret>c-<esc>zs[^a-z0-9-_]d<a-i>b"ay'

				execute-keys 'i[<esc>a]<esc>"api(<esc>a.md)<esc>'
      }
    }
  }
}

