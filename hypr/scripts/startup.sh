#!/bin/bash
copyq --start-server
swaybg -i ~/.config/hypr/wallpapers/balls.jpg -m fill &
waybar &
swayidle -w &
# Workaround: for some reasons, xdg-desktop-portal-hyprland goes crazy at startup 
systemctl --user restart xdg-desktop-portal-hyprland.service
ddcutil setvcp 10 40
brightnessctl set 40%

