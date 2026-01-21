#!/usr/bin/env bash

WALLPAPER_DIR="$HOME/personal/backgrounds"

# Pick a random wallpaper (space-safe)
WALLPAPER=$(find "$WALLPAPER_DIR" -maxdepth 1 -type f | shuf -n 1)

# Apply to all monitors
hyprctl monitors -j | jq -r '.[].name' | while read -r monitor; do
    hyprctl hyprpaper wallpaper "$monitor,$WALLPAPER"
done
