# environment variables
source ~/.config/fish/env_vars.fish

# abbreviations
source ~/.config/fish/abbreviations.fish

if status is-interactive
  set fish_greeting      

  ## Starship Prompt config
  starship init fish | source
end

