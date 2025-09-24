#!/bin/bash

NIGHT_TEMP=2700 # warm

if pgrep -x "hyprsunset" > /dev/null; then
    pkill hyprsunset
else
    hyprsunset --temperature $NIGHT_TEMP &
fi

