#!/bin/bash
#

if pgrep pipewire; then
  $XDG_CONFIG_HOME/waybar/modules/media-player.py
fi

