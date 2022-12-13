#!/bin/bash
# My preferred settings for i3lock-color.
# settings commented out are default in my branch as of 12/3/22.
# Someday perhaps i will mod my fork to read from a config file instead!

# constants
imagepath=$HOME/.local/share/wallpapers/xfce-101-no-logo.png
image_cmd="-i $imagepath -M"
nofork_cmd='-n'


# vars
nofork="$1";
i3lock_cmd="$image_cmd"

if [ "$nofork" = "nofork" ];
  then
    i3lock_cmd+=" $nofork_cmd"
fi
  
sleep 0.5
i3lock $i3lock_cmd

