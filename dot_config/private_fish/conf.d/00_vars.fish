set -xg PATH ~/.local/bin ~/bin $PATH

set -xg EDITOR (which nvim 1>/dev/null 2>/dev/null;
                and echo nvim;)

set -xg FISHCONF ~/.config/fish/config.fish
