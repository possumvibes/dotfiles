#!/bin/bash

# screensaver and locker
xset s 300 5 &
xss-lock -l -- screen-lock &

# night color adjustment
pgrep -x redshift > /dev/null || redshift &
