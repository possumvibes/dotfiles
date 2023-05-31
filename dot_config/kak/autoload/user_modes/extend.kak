# From https://github.com/alexherbo2/dotfiles/blob/master/.config/kak/autoload/user_modes/extend.kak
declare-user-mode extend

define-command enter_extend_mode %{
  enter-user-mode -lock extend
}

map global extend h   H       -docstring 'left'
map global extend j   J       -docstring 'down'
map global extend k   K       -docstring 'up'
map global extend l   L       -docstring 'right'
map global extend w   W       -docstring 'next word start'
map global extend e   E       -docstring 'next word end'
map global extend b   B       -docstring 'previous word start'
map global extend W   <a-W>   -docstring 'next long word start'
map global extend E   <a-E>   -docstring 'next long word end'
map global extend B   <a-B>   -docstring 'previous long word start'
map global extend n   N       -docstring 'next match'
map global extend N   <a-N>   -docstring 'previous match'
# map global extend f   F       -docstring 'find next char'
# map global extend F   <a-F>   -docstring 'find previous char'
# map global extend t   T       -docstring 'til next char'
# map global extend t   <a-T>   -docstring 'til previous char'
map global extend ';' '<a-;>' -docstring 'flip selections'

# define-command -hidden fhook %{
#   execute-keys ":hook buffer -once -always NormalIdle .* %{ enter-user-mode extend }<ret>F"
# }
# map global extend f ":hook buffer -once -always NormalIdle .* %{ enter-user-mode extend } <ret>F" -docstring "aaaaaaa"
