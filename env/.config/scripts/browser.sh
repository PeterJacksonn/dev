#!/usr/bin/env bash

prompt="Search: "
read -rp "$prompt" query

if [[ $query == yt* ]]; then
    search=$(echo "${query:3}" | tr ' ' '+')
    zen-browser "https://www.youtube.com/results?search_query=$search"
elif [[ $query == ddg* ]]; then
    search=$(echo "${query:4}" | tr ' ' '+')
    zen-browser "https://duckduckgo.com/?q=$search"
elif [[ $query == gh* ]]; then
    search=$(echo "${query:3}" | tr ' ' '+')
    zen-browser "https://github.com/search?q=$search"
else
    zen-browser "https://duckduckgo.com/?q=$(echo "$query" | tr ' ' '+')"
fi

addr=$(hyprctl clients -j | jq -r '.[] | select(.class=="zen") | .address' | tail -n1)
hyprctl dispatch focuswindow address:$addr
