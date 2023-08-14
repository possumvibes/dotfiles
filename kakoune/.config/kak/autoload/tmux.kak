# Adapted slightly from github.com/arrufat/config
# https://github.com/arrufat/config/blob/6780040cf109da3cbb91907317c8dd1d87a070b9/kak/tmux.kak

provide-module tmux-windowing %&

# Window management
# -----------------
    
map global window -docstring 'select pane left'  s %{:nop %sh{TMUX="${kak_client_env_TMUX}" tmux select-pane -L}<ret>}
map global window -docstring 'select pane down'  t %{:nop %sh{TMUX="${kak_client_env_TMUX}" tmux select-pane -D}<ret>}
map global window -docstring 'select pane up'    d %{:nop %sh{TMUX="${kak_client_env_TMUX}" tmux select-pane -U}<ret>}
map global window -docstring 'select pane right' h %{:nop %sh{TMUX="${kak_client_env_TMUX}" tmux select-pane -R}<ret>}

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
# ────────────────────────
define-command repl-right  -params .. %{
    tmux-repl-horizontal %arg{@}
} -docstring "create a repl on the right"
complete-command repl-right -menu shell

define-command repl-below  -params .. %{
    tmux-repl-vertical %arg{@}
} -docstring "create a repl below"
complete-command repl-below -menu shell

# IDE layout
# ----------
# (coming soon once i figure out how i want this arrayed)

# Convenience Aliases
alias global nr new-right
alias global nb new-below
alias global rr repl-right
alias global rb repl-below
alias global rb repl-below
&
