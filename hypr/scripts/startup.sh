#!/bin/bash
sway-audio-idle-inhibit &
#dbus-update-activation-environment --systemd --all
#systemctl --user import-environment QT_QPA_PLATFORMTHEME
wl-paste --watch cliphist store &
#wl-paste --type image --watch cliphist store &
swaybg -i ~/.config/hypr/wallpapers/anime_girls_cap.png -m fill &
waybar &
nextcloud --background &
swayidle -w &
otd-daemon &
ddcutil setvcp 10 40
brightnessctl set 40%
/usr/libexec/polkit-gnome-authentication-agent-1 &
swayosd-server &
AppImageLauncher "$HOME"/Applications/Bitwarden*.AppImage &
$XDG_CONFIG_HOME/hypr/scripts/auto-vpn.sh >$HOME/vpn.log &
