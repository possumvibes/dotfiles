# dotfiles: Chezmoi archive.
As of August 2023, I have migrated to using GNU stow for dotfiles instead of Chezmoi. I've found I prefer a more unix-y approach to dots management and that chezmoi, while a great and simple program to use, is too full-featured for my preference. For my home dots, I enjoy having simple and precise control over how my dots are installed, and I prefer managing secrets/encryption myself. I'm still using chezmoi at work--it's unbeatable on Windows. It's a great tool and I still highly recommend it!

The frozen state of the chezmoi-managed dots can be seen in branch `chezmoi_archive`.

# the dots, frozen in time from July 2023:
This repo contains dotfiles to set up my [bspwm](https://github.com/baskerville/bspwm) environment, currently riding on the coattails of XFCE on Fedora 36.

I use [Alacritty](https://alacritty.org/) as my terminal emulator, [Fish](fishshell.com/) as my shell, and [Neovim](neovim.io/) as my primary editor, and I have configs for a variety of other terminals, editors, and suchlike as I investigate them.

In the branch `chezmoi_archive`, I am managing dotfiles with [chezmoi](https://www.chezmoi.io).

(I do not recommend installing this. it is not "organized" or "complete" and there are absolutely no guarantees about it working.) 
