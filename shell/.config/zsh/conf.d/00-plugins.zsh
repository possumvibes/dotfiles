#######################################################################
# Possum's Dotfiles -- Zsh -- Plugins
# https://github.com/possumvibes/dotfiles
#######################################################################

# I'm currently using zgenom to manage plugins.
# Jury's out if I want to stick with that or go back to
# managing them manually.
# Either way, these need to be loaded before compinit is called
# and the safest way to do that is to load 'em first!

export ZGEN_DIR=$XDG_DATA_HOME/zgenom
export ZGEN_AUTOLOAD_COMPINIT=0

# Bootstrap zgenom if it's not installed.
if [ ! -d "$ZGEN_DIR" ]; then
    echo "Installing jandamm/zgenom"
    git clone https://github.com/jandamm/zgenom $ZGEN_DIR
fi
source $ZGEN_DIR/zgenom.zsh

# Check for plugin and zgenom updates every 7 days
# This does not increase the startup time.
zgenom autoupdate

if ! zgenom saved; then
    echo "Initializing zgenom"

    zgenom load jeffreytse/zsh-vi-mode

    # fzf must load after zsh-vi-mode to correctly override the bindings
    zgenom load /usr/share/fzf/key-bindings.zsh

    zgenom load zsh-users/zsh-completions 
    zgenom load zdharma-continuum/fast-syntax-highlighting
    zgenom load hlissner/zsh-autopair autopair.zsh

    zgenom save
fi

