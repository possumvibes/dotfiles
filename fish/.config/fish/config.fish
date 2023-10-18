
# config.fish is always sourced, so the bulk of logic is in conf.d scripts
# that explicitly limit the settings to the appropriate context!

# appearance and behavior
if status is-interactive
  set fish_greeting "go drink water."

  # Cursors
  set -g fish_cursor_default block
  set -g fish_cursor_insert line
  set -g fish_cursor_visual underscore

  fish_vi_key_bindings
end

