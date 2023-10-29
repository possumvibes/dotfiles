# Adapted slightly from github.com/arrufat/config
# https://github.com/arrufat/config/blob/6780040cf109da3cbb91907317c8dd1d87a070b9/kak/tmux.kak

provide-module tmux-windowing %&
    # Convenient client creation

    define-command new-right  -params .. %{
        tmux-terminal-horizontal kak -c %val{session} -e "%arg{@}"
    } -docstring "create a new Kakoune client on the right"
    complete-command new-right -menu command

    define-command new-below  -params .. %{
        tmux-terminal-vertical kak -c %val{session} -e "%arg{@}"
    } -docstring "create a new Kakoune client below"
    complete-command new-below -menu command

    define-command tabnew -params .. %{
        tmux-terminal-window kak -c %val{session} -e "%arg{@}"
    } -docstring "tabnew [<commands>]: create a new tmux window"

    # Improved repl management

    define-command repl-right  -params .. %{
        tmux-repl-horizontal %arg{@}
    } -docstring "create a repl on the right"
    complete-command repl-right -menu shell

    define-command repl-below  -params .. %{
        tmux-repl-vertical %arg{@}
    } -docstring "create a repl below"
    complete-command repl-below -menu shell

    # Convenience Aliases
    alias global nr new-right
    alias global nb new-below
    alias global rr repl-right
    alias global rb repl-below
    alias global rb repl-below

	# fzf-tmux integration
    define-command -override open-fzf-file-picker %{
        edit %sh{
            fzf-tmux --color=16 --preview "bat --style=numbers,changes --color always {}" -
        }
    } -docstring "open fzf fuzzy file picker. Requires fzf-tmux and tmux"

    # # IDE layout
    # # ----------

    define-command --override ide %{
        rename-client main
        tmux-terminal-horizontal kak -c %val{session} -e "rename-client docs"
        tmux-terminal-vertical kak -c %val{session} -e "rename-client tools"
        nop %sh{tmux swap-pane -s 0 -t 1}
        tmux-focus main
        set global docsclient docs
        set global toolsclient tools
        set global jumpclient main
        nop %sh{
            tmux resize-pane -t 0 -x 48
            tmux resize-pane -t 3 -x 80
            tmux resize-pane -t 2 -y 16
            tmux select-pane -t 0
        }
    } -docstring "tmux-specific ide implementation."

&
