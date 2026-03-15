#!/bin/bash
album_art=$(playerctl metadata mpris:artUrl 2>/dev/null)
if [[ -z "$album_art" ]]; then
	echo "" > /tmp/cover_url
	exit
fi
if ! grep -q "$album_art" /tmp/cover_url; then
    curl -s "${album_art}" --output /tmp/cover.jpeg
    echo "$album_art" > /tmp/cover_url
fi
echo "/tmp/cover.jpeg"
