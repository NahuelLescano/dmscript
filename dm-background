#!/usr/bin/env bash

DMENU="rofi -dmenu -i -p"

PATH_IMG=$HOME/Imágenes/Wallpapers/

if [[ -d $PATH_IMG ]]; then
    wallpapers=$(find "$PATH_IMG" -type f \( -name "*.jpg" -o -name "*.png" \) | sort)
    filenames=$(echo "$wallpapers" | xargs -n1 basename)
    choice_name=$(echo "$filenames" | ${DMENU} 'Select a wallpaper:' "$@") || exit 1
else
    echo "Directory $PATH_IMG does not exist."
    exit 1
fi

if [[ -n $choice_name ]]; then
    choice="${PATH_IMG}${choice_name}"
    
    echo "preload = $choice" > ~/.config/hypr/hyprpaper.conf
    echo "wallpaper = ,$choice" >> ~/.config/hypr/hyprpaper.conf

    pkill -f 'hyprpaper'

    hyprpaper &
    
    echo "Wallpaper set to: $choice"
else
    echo "No wallpaper selected."
    exit 1
fi
