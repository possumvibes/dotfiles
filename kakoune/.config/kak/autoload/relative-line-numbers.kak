# Relative Line Numbers:
# Automatically change from relative to absolute line numbers across modes.
# This command overrides the base number-lines highlighter settings, if any,
# and toggles between absolute numbers while in INSERT mode and relative numbers in NORMAL
# mode.

define-command -override enable-relative-line-numbers %{
    add-highlighter global/number-lines number-lines -hlcursor -relative

    hook global -group relative-line-numbers ModeChange .*:insert %{
        add-highlighter -override global/number-lines number-lines -hlcursor
    }

    hook global -group relative-line-numbers ModeChange .*:insert:.* %{
        add-highlighter -override global/number-lines number-lines -hlcursor -relative
    }
} -docstring 'adds hooks to toggle relative line numbers in NORMAL mode and absolute line numbers in INSERT.'

define-command -override disable-relative-line-numbers %{
    remove-hooks global relative-line-numbers
    remove-highlighter global/number-lines

} -docstring 'removes line-number toggling. Line number display will set to whatever base highlighter is in effect.'


 
