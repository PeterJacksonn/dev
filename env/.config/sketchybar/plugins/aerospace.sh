#!/usr/bin/env bash
export PATH="/opt/homebrew/bin:$PATH"

WORKSPACE="$1"

# Find visible workspaces across all monitors.
VISIBLE_WORKSPACES=$(aerospace list-workspaces \
  --monitor all \
  --visible \
  --format '%{workspace}|%{workspace-is-focused}')

STATE=$(echo "$VISIBLE_WORKSPACES" | awk -F'|' -v ws="$WORKSPACE" '$1 == ws { print $2 }')

if [ "$STATE" = "true" ]; then
  # Focused workspace: full accent
  sketchybar --set "$NAME" \
    background.drawing=on \
    background.color=0xffc4a7e7 \
    label.color=0xff232136

elif [ "$STATE" = "false" ]; then
  # Other monitor's visible workspace: subtle accent
  sketchybar --set "$NAME" \
    background.drawing=on \
    background.color=0xff514968 \
    label.color=0xffe0def4

else
  # Inactive workspace: no highlight
  sketchybar --set "$NAME" \
    background.drawing=off \
    label.color=0xffe0def4
fi
