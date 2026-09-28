#!/usr/bin/env bash
export PATH="/opt/homebrew/bin:$PATH"
VOL="$(osascript -e 'output volume of (get volume settings)')"
sketchybar --set "$NAME" label="VOL ${VOL}%"
