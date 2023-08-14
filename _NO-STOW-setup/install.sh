#!/bin/bash
#
# Scripts to bootstrap the environment. Use `stow-headless` for a headless install, and use `stow-full-desktop` for a GUI desktop install.


stow-shell() {
    echo "stowing git and shell configs..."
    stow bat bin git shell tmux
}

stow-editors() {
	echo "stowing editors..."
    stow kakoune nvim vim

	echo "setting up kakoune autoload and plugin manager..."
	## kak: symlink standard autoload into local autoload
    # symlink standard lib
    ln -s $(readlink -f "$(dirname $(type -p kak))"/../share/kak/autoload) ~/.config/kak/autoload/standard-library

    ## Install kak-bundle package manager
    mkdir -p ~/.config/kak/bundle
    git clone https://github.com/jdugan6240/kak-bundle ~/.config/kak/bundle/kak-bundle
}

stow-headless() {
    stow-shell
    stow-editors
}

stow-full-desktop() {
    stow-headless

	echo "stowing terminals..."
	stow alacritty kitty fontconfig

	echo "stowing window manager and friends..."
	stow bspwm 

}
