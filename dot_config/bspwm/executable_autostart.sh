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

# cleanup :) 
pkill xss-lock 
pkill redshift
pkill dunst
sleep 0.01

#### UTILITIES ####

# screensaver and locker of choice
xset s 300 5 &

# xsecurelock config, temp
xss-lock -l -- lock-screen-xsecurelock &

# notifications
dunst &

#### SOUP ####
# night color adjustment
redshift &
# background! this will be fancy someday
feh --bg-scale $wallpaperdir/deep_space_51_nologo.jpg

# panel, if bspwm session
if [ "$GDMSESSION" == "bspwm" ]
then
  ~/.config/polybar/launch.sh 
fi

notify-send "Autostart Complete" "BSPWM session is up and running!"
