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
xset s 600 &
xss-lock -l -- lock-screen nofork &

# notifications
pgrep -x dunst > /dev/null || dunst &
pgrep -x redshift > /dev/null || redshift &

#### SOUP ####

# background: someday this will be fancy
feh --bg-scale $wallpaperdir/deep_space_51_nologo.jpg

# panel
~/.config/polybar/launch.sh &

