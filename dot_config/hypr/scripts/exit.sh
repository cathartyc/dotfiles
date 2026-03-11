#!/bin/sh

get_state () {
    LOCK="/tmp/exit.lock"
    if [ -f "$LOCK" ]; then
        rm "$LOCK"
        return 0
    fi
    touch "$LOCK"
    return 1
}

if get_state; then
    hyprctl dispatch exit
else
    hyprctl notify 0 5000 "0" "fontsize:30   Press again to exit ."
    sleep 5
    get_state
fi
