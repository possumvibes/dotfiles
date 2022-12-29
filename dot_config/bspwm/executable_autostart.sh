#!/bin/bash

##################################
##################################
####                          ####
###  Desktop AutoStart Script  ###
####                          ####
##################################
##################################

# for desktops that are bspwm :)

#### VARIABLES ####
#
wallpaperdir=$HOME/.local/share/wallpapers/current

#### UTILITIES ####

# screensaver and locker of choice
xset s 300 5 &

# xsecurelock config, temp
export XSECURELOCK_COMPOSITE_OBSCURER=0
export XSECURELOCK_AUTH_CURSOR_BLINK=0
export XSECURELOCK_SHOW_USERNAME=0
export XSECURELOCK_SHOW_HOSTNAME=0
export XSECURELOCK_SHOW_DATETIME=1
# export XSECURELOCK_SAVER='saver_mpv'
# export XSECURELOCK_LIST_VIDEOS_COMMAND='find .local/share/wallpapers -type f'
# export XSECURELOCK_IMAGE_DURATION_SECONDS=60
xss-lock -l -- xsecurelock &

# notifications
pgrep -x dunst > /dev/null || dunst &
pgrep -x redshift > /dev/null || redshift &

#### SOUP ####

# background: someday this will be fancy
feh --bg-scale $wallpaperdir/deep_space_51_nologo.jpg

# panel
~/.config/polybar/launch.sh &

