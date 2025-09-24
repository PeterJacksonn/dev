#!/bin/bash

CACHE_ROOT=~/personal/backgrounds/thumbnails
WALLPAPER_ROOT=~/personal/backgrounds

# Create cache dir if it doesn't exist
mkdir -p "$CACHE_ROOT"

# Helper to make a thumbnail
function cacheImg {
    resolution=$(ffprobe -v error -select_streams v:0 -show_entries stream=width,height -of csv=p=0 "$1")
    width_=$(echo "${resolution}" | awk -F',' '{print $1}')
    height_=$(echo "${resolution}" | awk -F',' '{print $2}')
    
    if [ "$width_" -lt "$height_" ]; then
        ffmpeg -i "$1" -loglevel quiet -vf "scale=600:-1, crop=600:600:0:(ih-600)/2" "$2"
    else
        ffmpeg -i "$1" -loglevel quiet -vf "scale=-1:600, crop=600:600:(iw-600)/2:0" "$2"
    fi
    echo "$2"
}

# Get basename without extension
function getFileName {
    echo "$1" | xargs basename | awk -F'.' '{print $1}'
}

# Build lists
mapfile -t originPath < <(find "$WALLPAPER_ROOT" -maxdepth 1 -type f)
mapfile -t cachedPath < <(find "$CACHE_ROOT" -maxdepth 1 -type f)

declare -A bgresult
declare -A cachedresult
bgnames=()

# Original wallpapers
for pathIDX in "${!originPath[@]}"; do
    filename=$(getFileName "${originPath[$pathIDX]}")
    bgresult["$filename"]="${originPath[$pathIDX]}"
    bgnames[$pathIDX]="$filename"
done

# Cached thumbnails
for pathIDX in "${!cachedPath[@]}"; do
    filename=$(getFileName "${cachedPath[$pathIDX]}")
    cachedresult["$filename"]="${cachedPath[$pathIDX]}"
done

# Generate cached thumbnails if missing
for fName in "${bgnames[@]}"; do
    if [[ -v cachedresult[$fName] ]]; then
        :
    else
        cachedresult[$fName]=$(cacheImg "${bgresult[$fName]}" "${CACHE_ROOT}/${fName}.png")
    fi
done

# Build Rofi menu with thumbnails
strrr=""
for fName in "${bgnames[@]}"; do
    strrr+="$(echo -n "${fName}\0icon\x1f${cachedresult[$fName]}\n")"
done

# Show Rofi
selected=$(echo -en "$strrr" | sort | rofi -dmenu -i -no-layers -p "Select wallpaper" -config $1)

# Set wallpaper via Hyprpaper
if [[ -n "$selected" ]]; then
    fullpath="${bgresult[$selected]}"
    hyprctl hyprpaper reload ",$fullpath"
fi

