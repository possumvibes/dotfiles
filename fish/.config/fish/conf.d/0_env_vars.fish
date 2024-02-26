#######################################
# Possum Dotfiles
# https://github.com/possumvibes/dotfiles
# Fish Environment
# #####################################

# Load existing fisher path/plugins
# (so we can use 'em to source the environment)
# TODO: move bash2env into ./functions and move this logic back to 20_plugins.fish (and put this file back to login only!!)
set fisher_path ~/.config/fish/fisher_plugins
if test -d $fisher_path
    # Add fisher_path to completion and function paths
	set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..]
	set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..]

    # Source installed fisher plugins
    for file in $fisher_path/conf.d/*.fish
        source $file
    end
end

if type -q bash2env
    bash2env source /etc/profile
    bash2env source $HOME/.config/shell.d/0_env.sh
end

