#!/bin/bash

# Terminate already running bar instances
# If all your bars have ipc enabled, you can use 
polybar-msg cmd quit
# Otherwise you can use the nuclear option:
# killall -q polybar
#
# # launch ye olde polybars
barname="possumtest"

echo "---" | tee -a /tmp/$barname.log
polybar $barname -r 2>&1 | tee -a /tmp/$barname.log & disown
