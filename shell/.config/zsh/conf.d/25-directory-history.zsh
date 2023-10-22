#######################################################################
# Possum's Dotfiles -- Zsh -- Directory History Settings
# https://github.com/possumvibes/dotfiles
#######################################################################

# Set the stack size to 10, which, conveniently, is how many number keys we have.
DIRSTACKSIZE=10

setopt auto_cd
setopt cdable_vars

# Save directory history automatically with as few duplicates as possible.
setopt auto_pushd           # Push the old directory onto the stack on cd.
setopt pushd_ignore_dups    # Do not store duplicates in the stack.
setopt pushd_silent         # Do not print the directory stack after pushd or popd.
setopt pushd_to_home        # Push to home directory when no argument is given.

# And with all these pieces in place:
# on every dir change, automatically push to the dir stack.
# use d for fast visuals
# and use the number keys to move to the dir stack index!
alias d='dirs -v'
for index ({1..9}) alias "$index"="cd +${index}"; unset index
