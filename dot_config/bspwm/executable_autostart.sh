#!/bin/bash

# variables and paths
imagepath=$HOME/.local/share/wallpapers/xfce-101-no-logo.png

# screensaver and locker of choice
xset s 600 &
xss-lock --transfer-sleep-lock -- i3lock -i $imagepath -M -n &

# compositor
# picom &

# panel
~/.config/polybar/launch.sh &

# notifications
dunst &

# Redshift
redshift &

