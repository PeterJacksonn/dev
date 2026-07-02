#!/usr/bin/env bash
ID=$(xinput list --id-only "AT Translated Set 2 keyboard")
STATE=$(xinput list-props "$ID" | grep "Device Enabled" | awk '{print $NF}')

if [ "$STATE" = "1" ]; then
    xinput disable "$ID"
    notify-send "Laptop keyboard" "disabled"
else
    xinput enable "$ID"
    notify-send "Laptop keyboard" "enabled"
fi
