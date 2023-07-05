function sup --wraps='source $FSHDIR/config.fish && echo reloaded config.fish' --wraps='source $__fish_config_dir/config.fish && echo reloaded config.fish' --description 'alias sup source $__fish_config_dir/config.fish && echo reloaded config.fish'
  source $__fish_config_dir/config.fish && echo reloaded config.fish $argv; 
end
