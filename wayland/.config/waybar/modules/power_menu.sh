#!/bin/bash

SELECTION="$(printf "󰌾 Lock\n󰍃 Log out\n Reboot\n Reboot to UEFI\n󰐥 Shutdown" | fuzzel --dmenu -a top-right -l 6 -w 18 -p "Select an option: ")"

confirm_action() {
    local action="$1"
    CONFIRMATION="$(printf "No\nYes" | fuzzel --dmenu -a top-right -l 2 -w 18 -p "$action?")"
    [[ "$CONFIRMATION" == *"Yes"* ]]
}

logout(){
  if [[ $XDG_SESSION_DESKTOP == "niri" ]]; then
    niri msg action quit
  else
    sway exit
  fi
}

case $SELECTION in
    *"󰌾 Lock"*)
        $XDG_CONFIG_HOME/niri/scripts/lockniri;;
    # *"󰤄 Suspend"*)
    #     if confirm_action "Suspend"; then
    #         loginctl suspend
    #     fi;;
    *"󰍃 Log out"*)
        if confirm_action "Log out"; then
            niri msg action quit
        fi;;
    *" Reboot"*)
        if confirm_action "Reboot"; then
            loginctl reboot
        fi;;
    *" Reboot to UEFI"*)
        if confirm_action "Reboot to UEFI"; then
            loginctl reboot --firmware-setup
        fi;;
    *"󰐥 Shutdown"*)
        if confirm_action "Shutdown"; then
            loginctl poweroff
        fi;;
esac
