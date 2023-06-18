#!/bin/sh

# ## ### ##### ########
##
# CHEZMOI INSTALL SCRIPT
#
# Updated for Void Linux.
# Installs packages for headless and graphical installations.
##
# ## ### ##### 

set -e

# Set variables ---------------------------------------------------------
PACKAGES=(
	python3 python3-pip # languages
  gcc cmake # build tools
  fish neovim helix kakoune tmux # shell
  bat exa fd htop ripgrep # terminal tools
  starship nerd-fonts # shell prettification
  restic borg syncthing pass # sync and backup
  git delta # source control
  curl wget rsync unzip zip # utilities
)

RUST_PACKAGES=(
  trashy 
)

GRAPHICAL_PACKAGES=(
  bspwm sxhkd polybar rofi # WM
  dunst xss-lock xsecurelock flameshot # utilities
  picom feh redshift # prettification
  alacritty keepassxc firefox thunar # apps
  zathura gnumeric libreoffice thunderbird # file edit/view
  flatpak  # :)
)

# Install packages ------------------------------------------------------

# Void official packages
sudo xbps-install -Sy "${PACKAGES[@]}"

# Install Rust and packages
if ! which cargo 2>/dev/null; then
  curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | \
    sh -s -- -y --no-modify-path --default-toolchain stable \
    --component rust-src rust-analyzer
fi
cargo install "${RUST_PACKAGES[@]}"

# Set fish as the default shell
FISH_PATH=$(which fish)
if test "$SHELL" != "$FISH_PATH"; then
  if ! grep "$FISH_PATH" /etc/shells; then
    echo "$FISH_PATH" | sudo tee -a /etc/shells
  fi
  sudo chsh -s "$FISH_PATH" $(whoami)
fi

# Graphical packages
if test $(chezmoi data | jq ".isHeadless") = "false"; then
  # Install GUI apps
  sudo xbps-install -Sy "${GRAPHICAL_PACKAGES[@]}"

  # add flathub repo (restart required)
  flatpak remote-add --if-not-exists flathub https://flathub.org/repo/flathub.flatpakrepo

  echo "restart is required."
fi

# Add kak autoload symlink
mkdir -p "${XDG_CONFIG_HOME:-${HOME}/.config}"/kak/autoload
ln -s /usr/share/kak/rc "${XDG_CONFIG_HOME:-${HOME}/.config}"/kak/autoload


echo "basic machine application install complete!"
