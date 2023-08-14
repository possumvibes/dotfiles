function bootstrap-fisher
    set fisher_path ~/.config/fish/fisher_plugins

    echo "Bootstrapping fisher..."
    cp ~/.config/fish/fish_plugins ~/.config/fish/fish_plugins.bak
    mkdir -p $fisher_path; cd fisher_path

    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

    # Ensure files in $fisher_path are accessible to fish
    ! set --query fisher_path[1] || test "$fisher_path" = $__fish_config_dir && exit

    set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..]
    set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..]

    for file in $fisher_path/conf.d/*.fish
        source $file
    end

    echo "reinstalling plugins..."
    cd ~/.config/fish
    cp ~/.config/fish_plugins.bak ~/.config/fish_plugins
    fisher update

end
