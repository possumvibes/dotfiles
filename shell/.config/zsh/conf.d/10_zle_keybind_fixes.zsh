# Fix navigation keys by terminal, based on zkbd and xterm escape codes

# If bindings stop working, re-enable this and rerun it on the new hardware
# autoload -Uz zkbd # handle terminal escape differences

# Note: I don't have all of the `keys` escape sequences available with my hardware/software
#  at time of writing. (i.e., not all keys are present on my keyboard and not all key
#  combinations produce escape codes at all.) If issues arise, check first if the
#  unhandled escape codes are in `keys` and unbound. If they aren't present, update
#  the escape code mappings below to route the code to the correct xterm binding.

# ********************************
# BINDING STRAY ESCAPE CODES

# using the zkbd values from xterm, alacritty, rxvt-unicode, and tmux,
# let us bind the weirdo bindings directly to the expected xterm ones
# home
'bindkey' '-s' '^[[1~'   '^[[H'
'bindkey' '-s' '^[[7~'   '^[[H'
# end
'bindkey' '-s' '^[OF'    '^[[F'
'bindkey' '-s' '^[[4~'   '^[[F'
'bindkey' '-s' '^[[8~'   '^[[F'
# Ctrl-Del
'bindkey' '-s' '^[[3\^'  '^[[3;5~'
'bindkey' '-s' '^[^[[3~' '^[[3;3~'
# Alt-Left/Right
'bindkey' '-s' '^[[1;9C' '^[[1;3C'
'bindkey' '-s' '^[^[[C'  '^[[1;3C'
'bindkey' '-s' '^[[1;9D' '^[[1;3D'
'bindkey' '-s' '^[^[[D'  '^[[1;3D'
# Ctrl- Left/Right
'bindkey' '-s' '^[Od'    '^[[1;5D'
'bindkey' '-s' '^[Oc'    '^[[1;5C'

# ********************************
# DEFINING THE BINDABLE KEYS ARRAY

# Define the keyset for the tricky keys and their mod variants:
# from https://github.com/Phantas0s/.dotfiles/blob/f961d9741fc12879d6ae28609287955abf1d56bc/zsh/bindings.zsh
typeset -gA keys=(
    Up                   '^[[A'
    Down                 '^[[B'
    Right                '^[[C'
    Left                 '^[[D'
    Home                 '^[[H'
    End                  '^[[F'
    Insert               '^[[2~'
    Delete               '^[[3~'
    PageUp               '^[[5~'
    PageDown             '^[[6~'
    Backspace            '^?'

    Shift+Up             '^[[1;2A'
    Shift+Down           '^[[1;2B'
    Shift+Right          '^[[1;2C'
    Shift+Left           '^[[1;2D'
    Shift+End            '^[[1;2F'
    Shift+Home           '^[[1;2H'
    Shift+Insert         '^[[2;2~'
    Shift+Delete         '^[[3;2~'
    Shift+PageUp         '^[[5;2~'
    Shift+PageDown       '^[[6;2~'
    Shift+Backspace      '^?'
    Shift+Tab            '^[[Z'

    Alt+Up               '^[[1;3A'
    Alt+Down             '^[[1;3B'
    Alt+Right            '^[[1;3C'
    Alt+Left             '^[[1;3D'
    Alt+End              '^[[1;3F'
    Alt+Home             '^[[1;3H'
    Alt+Insert           '^[[2;3~'
    Alt+Delete           '^[[3;3~'
    Alt+PageUp           '^[[5;3~'
    Alt+PageDown         '^[[6;3~'
    Alt+Backspace        '^[^?'

    Alt+Shift+Up         '^[[1;4A'
    Alt+Shift+Down       '^[[1;4B'
    Alt+Shift+Right      '^[[1;4C'
    Alt+Shift+Left       '^[[1;4D'
    Alt+Shift+End        '^[[1;4F'
    Alt+Shift+Home       '^[[1;4H'
    Alt+Shift+Insert     '^[[2;4~'
    Alt+Shift+Delete     '^[[3;4~'
    Alt+Shift+PageUp     '^[[5;4~'
    Alt+Shift+PageDown   '^[[6;4~'
    Alt+Shift+Backspace  '^[^H'

    Ctrl+Up              '^[[1;5A'
    Ctrl+Down            '^[[1;5B'
    Ctrl+Right           '^[[1;5C'
    Ctrl+Left            '^[[1;5D'
    Ctrl+Home            '^[[1;5H'
    Ctrl+End             '^[[1;5F'
    Ctrl+Insert          '^[[2;5~'
    Ctrl+Delete          '^[[3;5~'
    Ctrl+PageUp          '^[[5;5~'
    Ctrl+PageDown        '^[[6;5~'
    Ctrl+Backspace       '^H'

    Ctrl+Shift+Up        '^[[1;6A'
    Ctrl+Shift+Down      '^[[1;6B'
    Ctrl+Shift+Right     '^[[1;6C'
    Ctrl+Shift+Left      '^[[1;6D'
    Ctrl+Shift+Home      '^[[1;6H'
    Ctrl+Shift+End       '^[[1;6F'
    Ctrl+Shift+Insert    '^[[2;6~'
    Ctrl+Shift+Delete    '^[[3;6~'
    Ctrl+Shift+PageUp    '^[[5;6~'
    Ctrl+Shift+PageDown  '^[[6;6~'
    Ctrl+Shift+Backspace '^?'

    Ctrl+Alt+Up          '^[[1;7A'
    Ctrl+Alt+Down        '^[[1;7B'
    Ctrl+Alt+Right       '^[[1;7C'
    Ctrl+Alt+Left        '^[[1;7D'
    Ctrl+Alt+Home        '^[[1;7H'
    Ctrl+Alt+End         '^[[1;7F'
    Ctrl+Alt+Insert      '^[[2;7~'
    Ctrl+Alt+Delete      '^[[3;7~'
    Ctrl+Alt+PageUp      '^[[5;7~'
    Ctrl+Alt+PageDown    '^[[6;7~'
    Ctrl+Alt+Backspace   '^[^H'

    Ctrl+Alt+Shift+Up        '^[[1;8A'
    Ctrl+Alt+Shift+Down      '^[[1;8B'
    Ctrl+Alt+Shift+Right     '^[[1;8C'
    Ctrl+Alt+Shift+Left      '^[[1;8D'
    Ctrl+Alt+Shift+Home      '^[[1;8H'
    Ctrl+Alt+Shift+End       '^[[1;8F'
    Ctrl+Alt+Shift+Insert    '^[[2;8~'
    Ctrl+Alt+Shift+Delete    '^[[3;8~'
    Ctrl+Alt+Shift+PageUp    '^[[5;8~'
    Ctrl+Alt+Shift+PageDown  '^[[6;8~'
    Ctrl+Alt+Shift+Backspace '^?'
  )

# ********************************
# BINDING THE NOW-KNOWN KEYS

bindkey -- "${keys[Home]}"            .beginning-of-line
bindkey -- "${keys[End]}"             .end-of-line
bindkey -- "${keys[Insert]}"          .overwrite-mode
bindkey -- "${keys[Backspace]}"       .backward-delete-char
bindkey -- "${keys[Delete]}"          .delete-char
bindkey -- "${keys[Up]}"              .up-line-or-history
bindkey -- "${keys[Down]}"            .down-line-or-history
bindkey -- "${keys[Left]}"            .backward-char
bindkey -- "${keys[Right]}"           .forward-char
bindkey -- "${keys[PageUp]}"          .beginning-of-buffer-or-history
bindkey -- "${keys[PageDown]}"        .end-of-buffer-or-history
bindkey -- "${keys[Shift+Tab]}"       .reverse-menu-complete
bindkey -- "${keys[Ctrl+Left]}"       .backward-word
bindkey -- "${keys[Ctrl+Right]}"      .forward-word

