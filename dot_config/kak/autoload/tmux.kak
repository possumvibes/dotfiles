# Adapted slightly from github.com/arrufat/config
# https://github.com/arrufat/config/blob/6780040cf109da3cbb91907317c8dd1d87a070b9/kak/tmux.kak

provide-module tmux-windowing %&

  # Window management
  # -----------------
	
  map global window -docstring 'select pane left'  s %{:nop %sh{TMUX="${kak_client_env_TMUX}" tmux select-pane -L}<ret>}
  map global window -docstring 'select pane down'  t %{:nop %sh{TMUX="${kak_client_env_TMUX}" tmux select-pane -D}<ret>}
  map global window -docstring 'select pane up'    d %{:nop %sh{TMUX="${kak_client_env_TMUX}" tmux select-pane -U}<ret>}
  map global window -docstring 'select pane right' h %{:nop %sh{TMUX="${kak_client_env_TMUX}" tmux select-pane -R}<ret>}

  define-command new-right -docstring "create a new Kakoune client on the right" -params .. %{
      tmux-terminal-horizontal kak -c %val{session} -e "%arg{@}"}
  alias global nr new-right
  complete-command new-right -menu command
  define-command new-below -docstring "create a new Kakoune client below" -params .. %{
      tmux-terminal-vertical kak -c %val{session} -e "%arg{@}"}
  alias global nb new-below
  complete-command new-below -menu command

  # Improved repl management
  # ────────────────────────
  define-command repl-right -docstring "create a repl on the right" -params .. %{
      tmux-repl-horizontal %arg{@}
  }
  alias global rr repl-right
  complete-command repl-right -menu shell
  define-command repl-below -docstring "create a repl below" -params .. %{
      tmux-repl-vertical %arg{@}
  }
  alias global rb repl-below
  complete-command repl-below -menu shell

  # IDE layout
  # ----------

  #coming soon once i figure out how i want this arrayed
  #

&
