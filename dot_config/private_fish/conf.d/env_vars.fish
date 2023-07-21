# Tools
set -xg SXHKD_SHELL '/usr/bin/sh'

# Editor
set -xg EDITOR "kak"
set -xg VISUAL "kak"

# Convenience Directories
set -xg DOTS_DIR "$HOME/.local/share/chezmoi"
set -xg FSHDIR $XDG_CONFIG_HOME/fish
set -xg NOTEBOOK_DIR "$HOME/ari-common/ari_yelling"
set -xg WALLPAPER_DIR "$HOME/.local/share/wallpapers"


# XDG Compliance
set -xg XDG_CONFIG_HOME $HOME/.config

set -xg STARSHIP_CONFIG $XDG_CONFIG_HOME/starship/starship.toml
set -xg VIMDIR $XDG_CONFIG_HOME/nvim

