#!/bin/bash

##################################
##################################
####                          ####
###   BSPWM AutoStart Script   ###
####                          ####
##################################
##################################

# Autostart script to bootstrap the BSPWM environment.
# This could conceivably be used with any DE-less WM
# (and would require some adjustments for usage within a DE session.)
 
# Tools of note:
#
# NAME        DESCRIPTION
# -----------|-------------------------------------------
# SXHKD       hotkey daemon (see ~/.config/sxhkd/sxhkdrc)
# Dunst       notifications (see ~/.config/dunst/dunstrc)
# xss-lock    to enable screensaver
# xsecurelock the actual screensaver
# feh         background and image viewer
# picom       compositor (see ~/.config/picom/picom.conf)
# polybar     bar (see ~/.config/polybar/config.ini)



# Start hotkey daemon (sxhkd)
export SXHKD_SHELL="sh" # important for speed
pgrep -x sxhkd > /dev/null || sxhkd &

# expose helper function to see the config
list_sxhkd_bindings(){
	if [ -f ~/.config/sxhkd/sxhkdrc ]; then
  	bat ~/.config/sxhkd/sxhkdrc 
	fi
}

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
feh --bg-scale ~/.local/share/wallpapers/current/Deep_Space_75_Withou_A_Logo.jpg

# panel, if bspwm session
if [ "$GDMSESSION" == "bspwm" ]
then
  ~/.config/polybar/launch.sh 
fi

notify-send "Autostart Complete" "BSPWM session is up and running!"
