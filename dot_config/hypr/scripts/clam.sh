#!/bin/bash
# Make the laptop work as a clamshell: when closed, the programs are
# transferred on the external monitor along with their workspaces.

if [[ $1 == "open" ]]; then
	#echo "lid on"
	hyprctl keyword monitor "eDP-1,preferred,0x0,1"
	hyprctl keyword monitor "HDMI-A-1,preferred,1920x-420,1"
else
	#echo "lid off"
	hyprctl keyword monitor "eDP-1,disable"
fi
