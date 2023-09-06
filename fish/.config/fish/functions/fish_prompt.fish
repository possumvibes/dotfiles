set fish_prompt_pwd_dir_length 0

# Git prompt
set __fish_git_prompt_showuntrackedfiles 'no'
set __fish_git_prompt_showdirtystate 'yes'
set __fish_git_prompt_showupstream 'yes'
set __fish_git_prompt_showstashstate 'yes'

set __fish_git_prompt_color_merging magenta
set __fish_git_prompt_color_untrackedfiles yellow
set __fish_git_prompt_color_dirtystate yellow
set __fish_git_prompt_color_stashstate yellow
set __fish_git_prompt_color_stagedstate cyan
set __fish_git_prompt_color_upstream blue

# Git Characters
set __fish_git_prompt_char_untrackedfiles '?'
set __fish_git_prompt_char_stateseparator ''
set __fish_git_prompt_char_dirtystate '!'
set __fish_git_prompt_char_stagedstate '+'
set __fish_git_prompt_char_stashstate '$'
set __fish_git_prompt_char_upstream_prefix ''
set __fish_git_prompt_char_upstream_equal ''
set __fish_git_prompt_char_upstream_ahead '⇡'
set __fish_git_prompt_char_upstream_behind '⇣'
set __fish_git_prompt_char_upstream_diverged '⇕'

function _print_in_color
    set_color $argv[2]
    printf $argv[1]
    set_color normal
end

function _prompt_color_for_status
    if test $argv[1] -eq 0
        echo brgreen
    else
        echo brred
    end
end

function fish_prompt
    set -l last_status $status

    # if test "$CMD_DURATION" -gt 300000
    #     _print_in_color "INFO: The last command took "(math "$CMD_DURATION/60000")" minutes\n" yellow
    # end

    printf "\n"

    if test -n "$SSH_TTY"
        _print_in_color $USER blue
        _print_in_color "@" brwhite
        _print_in_color (prompt_hostname) green
        _print_in_color ":" brwhite
    end

    _print_in_color (prompt_pwd -D 64) brblue


    if not type -q ignore_git; or not ignore_git
        fish_git_prompt " %s"
    end
    _print_in_color "\n\$ " (_prompt_color_for_status $last_status)

end
