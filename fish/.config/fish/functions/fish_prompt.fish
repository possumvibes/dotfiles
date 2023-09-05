function fish_prompt
    # Set return color based on previous status
    set -l retc brred
    test $status = 0; and set retc brgreen

    echo # newline

	set -l baseprompt ""

    set -g VIRTUAL_ENV_DISABLE_PROMPT true
    # set -q VIRTUAL_ENV; and echo -n (set_color white)'['(basename "$VIRTUAL_ENV")'] '
    set -q VIRTUAL_ENV; and set -l baseprompt "$baseprompt"(set_color white)'['(basename "$VIRTUAL_ENV")'] '

    if test -n "$SSH_TTY"; or fish_is_root_user;
        set baseprompt "$baseprompt"(set_color blue)$USER
        set baseprompt "$baseprompt"(set_color brwhite)"@"
        set baseprompt "$baseprompt"(set_color green)(prompt_hostname)
        set baseprompt "$baseprompt"(set_color brwhite)":"
    end

	set -l workingdir (set_color brblue)(prompt_pwd -D 64)" "
    # echo -n (set_color brblue)(prompt_pwd -D 64)
    # echo -n ' '
    set baseprompt "$baseprompt$workingdir"
    echo -n $baseprompt


	set -l git_info
        # set -l prompt_git (set_color white)(fish_git_prompt '%s')
        # echo -n $prompt_git
    set -l git_branch (git --no-optional-locks branch --show-current 2> /dev/null)
    if test -n "$git_branch"
        set -l git_status (git --no-optional-locks status --porcelain 2> /dev/null | tail -n 1)

        set  git_info "$git_info"(set_color white)$git_branch
        echo -n $git_info

        # todo only continue if there is some change
        # if test "$ahead" -gt 0; or test "$behind" -gt 0
		# ahead/behind status

        set -l porcelain_status (command git status --porcelain 2>/dev/null | string sub -l2)
		set -l dirty

		set -l untracked_status
        if string match -qe '\?\?' $porcelain_status
            set untracked_status (set_color yellow)"?"
        end
        # echo -n $untracked_status

		set -l modified_status
        if string match -qr '[MT]$' $porcelain_status
            # modified
            set modified_status (set_color yellow)"!"
        else if string match -qr '[ ACMRT]D' $porcelain_status
            # deleted
            set modified_status (set_color yellow)"!"
        else if string match -qe R $porcelain_status
            # renamed
            set modified_status (set_color yellow)"!"
        end
        # echo -n $modified_status

		set -l add_status
        if string match -qr '[ACDMT][ MT]|[ACMT]D' $porcelain_status
            # added
            set add_status (set_color cyan)"+"
        end
        # echo -n $add_status


		set -l upstream (set_color blue)
		command git rev-list --count --left-right @{upstream}...@ 2>/dev/null |
                read behind ahead
        if test "$ahead" -gt 0; and test "$behind" -gt 0
            set upstream "$upstream⇕" 
        else if test $ahead -gt 0
            set upstream "$upstream⇡"
        else if test $behind -gt 0
            set upstream "$upstream⇣"
        end

        set dirty "$untracked_status$modified_status$add_status$upstream"
        echo -n $dirty

    end

    set_color normal
    echo  # new line

    set_color $retc
    if functions -q fish_is_root_user; and fish_is_root_user
        echo -n '# '
    else
        echo -n '$ '
    end

    set_color normal
end
