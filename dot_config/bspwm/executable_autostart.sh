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

#### UTILITIES ####

# screensaver and locker of choice
xset s 300 5 &
xss-lock -l -- lock-screen-xsecurelock &

# notifications
pgrep -x dunst > /dev/null || dunst &

#### SOUP ####
pgrep -x picom > /dev/null || picom &

# night color adjustment
pgrep -x redshift > /dev/null || redshift &

# background! this will be fancy someday
feh --bg-scale $WALLPAPER_DIR/current/deep_space_51_nologo.jpg

# panel, if bspwm session
if [ "$GDMSESSION" == "bspwm" ]
then
  ~/.config/polybar/launch.sh 
fi

$HOME/scripts/reload_profile.fish

notify-send "Autostart Complete" "BSPWM session is up and running!"
