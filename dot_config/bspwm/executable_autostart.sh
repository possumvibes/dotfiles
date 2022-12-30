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
pkill xss-lock 
xss-lock -l -- ~/scripts/xsecurelock-conf &

# notifications
pgrep -x dunst > /dev/null || dunst &
pgrep -x redshift > /dev/null || redshift &

#### SOUP ####

# background: someday this will be fancy
feh --bg-scale $wallpaperdir/deep_space_51_nologo.jpg

# panel
~/.config/polybar/launch.sh &

