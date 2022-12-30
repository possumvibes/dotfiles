# update PATH if not already present
# technically only needs to happen once ever but
# it's easier to have it here for reference/replication
fish_add_path ~/.local/bin ~/.bin 

# environment variables
source ~/.config/fish/env_vars.fish

# abbreviations
source ~/.config/fish/abbreviations.fish

if status is-interactive
  set fish_greeting
 # set fish_autosuggestion_enabled 0

  ## Starship Prompt config
  starship init fish | source
end

