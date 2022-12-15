#!/bin/bash

# variables and paths
imagepath=$HOME/.local/share/wallpapers/xfce-101-no-logo.png
wallpaperdir=$HOME/.local/share/wallpapers/current

# background: someday this will be fancy
feh --bg-scale $wallpaperdir/deep_space_51_nologo.jpg

# screensaver and locker of choice
xset s 600 &
# xss-lock --transfer-sleep-lock -- i3lock -i $imagepath -M -n &
xss-lock --transfer-sleep-lock -- ~/scripts/locker.sh nofork &

# compositor
# picom &

# panel
~/.config/polybar/launch.sh &

# notifications
dunst &

# Redshift
redshift &

