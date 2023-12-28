#!/usr/bin/sh
#
# .profile is sourced at login for bash and (non-zsh) friends.
# It is also sourced for zsh on account of I'm sourcing it in my .zprofile.


# Ensure ssh-agent is started once and consistently
# note: .zprofile will need to source this file in sh emulation.

# Explicitly set SSH_AUTH_SOCK to reuse
export SSH_AUTH_SOCK=~/.ssh/ssh-agent.$HOSTNAME.sock

## If ssh-add can't connect to an agent, we need to start ssh-agent
ssh-add -l 2>/dev/null >/dev/null
if [ $? -ge 2 ]; then
  ## status 2 indicates that ssh-add cannot connect to ssh-agent.
  ## (status 1 indicates that ssh-agent is running with no keys to list.)
  ssh-agent -a "$SSH_AUTH_SOCK" >/dev/null
fi


if [ -z "$DISPLAY" ] && [ "$XDG_VTNR" = 1 ]; then
  exec startx
fi
