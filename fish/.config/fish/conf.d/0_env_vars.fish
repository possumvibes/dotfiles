
status is-login || exit

# 100% of the environment gets inherited from bash.
# hooray for bash2env!

bash2env source /etc/profile

# update PATH if not already present
# technically only needs to happen once ever but
# it's easier to have it here for reference/replication
fish_add_path ~/.cargo/bin ~/.local/bin ~/bin 
