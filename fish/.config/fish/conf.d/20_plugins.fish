status is-interactive || exit

if ! type -q fisher
    echo "Fisher is not installed. Please run bootstrap-fisher."
end

# Set a custom location for fisher plugins
set fisher_path ~/.config/fish/fisher_plugins

# Add fisher_path to completion and function paths
set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..]
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..]

# Source installed fisher plugins
for file in $fisher_path/conf.d/*.fish
    source $file
end
