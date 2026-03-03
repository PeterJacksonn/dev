#!/bin/bash

NIGHT_TEMP=2700
DAY_TEMP=6000

CURRENT=$(hyprctl hyprsunset temperature 2>/dev/null)

if [ -z "$CURRENT" ]; then
    hyprsunset --temperature $DAY_TEMP &
    exit 0
fi

if [ "$CURRENT" -eq "$DAY_TEMP" ]; then
    hyprctl hyprsunset temperature $NIGHT_TEMP
else
    hyprctl hyprsunset temperature $DAY_TEMP
fi
