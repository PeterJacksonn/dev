#!/usr/bin/env bash
export PATH="/opt/homebrew/bin:$PATH"
BATT="$(pmset -g batt)"
PCT="$(echo "$BATT" | grep -Eo '[0-9]+%' | head -1)"
[ -z "$PCT" ] && exit 0
if echo "$BATT" | grep -q 'AC Power'; then TAG="CHG"; else TAG="BAT"; fi
sketchybar --set "$NAME" label="$TAG $PCT"
