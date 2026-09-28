#!/usr/bin/env bash
export PATH="/opt/homebrew/bin:$PATH"
FOCUSED="${FOCUSED_WORKSPACE:-$(aerospace list-workspaces --focused)}"
if [ "$1" = "$FOCUSED" ]; then
  sketchybar --set "$NAME" background.drawing=on label.color=0xff232136
else
  sketchybar --set "$NAME" background.drawing=off label.color=0xffe0def4
fi
