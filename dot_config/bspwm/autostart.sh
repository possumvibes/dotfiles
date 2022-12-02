#!/bin/bash

# screensaver and locker of choice
xset s 600 &
xss-lock ~/scripts/locker.sh &

# panel
polybar example &

# notifications
dunst &
