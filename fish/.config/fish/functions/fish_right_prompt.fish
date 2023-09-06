#!/usr/bin/env fish

function fish_right_prompt
    if test -n "$fish_private_mode"
        _print_in_color "private " brblack
    end

    switch $fish_bind_mode
        case default
            set_color --bold brmagenta
            printf 'NOR'
        case insert
            set_color --bold yellow
            printf 'INS'
        case replace_one
            set_color --bold bryellow
            printf 'REP'
        case visual
            set_color --bold green
            printf 'VIS'
        case '*'
            set_color --bold red
            printf '[?]'
    end

    set_color normal
end
