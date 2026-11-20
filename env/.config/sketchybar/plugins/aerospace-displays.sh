#!/bin/bash

# Map AeroSpace monitor IDs to SketchyBar display IDs.
# These are NOT necessarily the same numbering.

while IFS='|' read -r monitor_id display_id monitor_name; do
  # Get every workspace belonging to this AeroSpace monitor.
  workspaces=$(aerospace list-workspaces \
    --monitor "$monitor_id" \
    --format '%{workspace}')

  while read -r sid; do
    [ -z "$sid" ] && continue

    sketchybar --set "space.$sid" display="$display_id"
  done <<< "$workspaces"

done < <(
  aerospace list-monitors \
    --format '%{monitor-id}|%{monitor-appkit-nsscreen-screens-id}|%{monitor-name}'
)
