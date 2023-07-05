set fisher_path ~/.config/fish/fisher_plugins

set bootstrapped ''
if type -q fisher
  echo "Bootstrapping fisher..."

  # make a backup copy of the plugins list
  cp fish_plugins fish_plugins.bak

  # Move to fisher_path
 	mkdir -p $fisher_path; cd $fisher_path
  curl -sL https://raw.githubusercontent.com/jorgebucaran/fisher/main/functions/fisher.fish | source && fisher install jorgebucaran/fisher

	set bootstrapped 'yes'
end

# Ensure files in $fisher_path are accessible to fish
! set --query fisher_path[1] || test "$fisher_path" = $__fish_config_dir && exit

set fish_complete_path $fish_complete_path[1] $fisher_path/completions $fish_complete_path[2..]
set fish_function_path $fish_function_path[1] $fisher_path/functions $fish_function_path[2..]

for file in $fisher_path/conf.d/*.fish
    source $file
end

if test -n $bootstrapped
  echo "reinstalling plugins..."
  mv fish_plugins.bak fish_plugins
  fisher update
end
