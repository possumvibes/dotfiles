function bootstrap-fisher
	if type -q fisher
    	printf "Fisher is already installed. To uninstall fisher and all plugins, run
    	`fisher list | fisher remove`\n"
    	printf "before calling this function again.\n"
     	return 1
	end

	printf "Installing fisher...\n"

	# Back up existing fish_plugins
	set -l pluginlist $__fish_config_dir/fish_plugins
	test -f $pluginlist && cp $pluginlist $pluginlist.bak
    
	# Set preferred fisher_path
    set fisher_path $__fish_config_dir/fisher_plugins
    mkdir -p $fisher_path
    
	# Initial install (this overwrites fisher_plugins)
    curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

    echo "reinstalling plugins..."
    cd $__fish_config_dir

	# Restore pluginlist from backup
    test -f $pluginlist.bak && mv $pluginlist.bak $pluginlist

    # install all plugins
    fisher update

    printf "fisher and plugins installed. Re-source config.fish to use them." 
end
