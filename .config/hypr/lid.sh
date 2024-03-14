#!/usr/bin/env zsh

if grep open /proc/acpi/button/lid/LID0/state; then
	notify-send "Clamshell Mode Ended, Restoring laptop screen"
	hyprctl keyword monitor "eDP-1,2256x1504@60,0x0,1.175,vrr,2"
else
	if [[ "$(hyprctl monitors)" =~ "\sDP-[0-9]+" ]]; then
	    notify-send "Clamshell Mode, Disabling laptop screen"
	    hyprctl keyword monitor "eDP-1,disable"
	fi
fi
