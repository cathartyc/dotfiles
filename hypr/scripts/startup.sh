#!/bin/bash
copyq --start-server
swaybg -i ~/.config/hypr/wallpapers/balls.jpg -m fill &
waybar &
swayidle -w &
ddcutil setvcp 10 40
brightnessctl set 40%

