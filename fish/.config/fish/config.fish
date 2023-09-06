# update PATH if not already present
# technically only needs to happen once ever but
# it's easier to have it here for reference/replication
fish_add_path ~/.cargo/bin ~/.local/bin ~/bin 

if status is-login
  bash2env source /etc/profile
end

if status is-interactive
  set fish_greeting

  # Cursors
  set -g fish_cursor_default block
  set -g fish_cursor_insert line
  set -g fish_cursor_visual underscore

  fish_vi_key_bindings

 # set fish_autosuggestion_enabled 0

  ## Starship Prompt config
  # if command -sq starship
  #   and starship init fish | source
  # end
end

