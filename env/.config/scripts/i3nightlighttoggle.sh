#!/bin/bash
if pgrep -x "gammastep" > /dev/null
then
    echo 'killing!'
    gammastep -m randr -x
    pkill gammastep
else
    echo 'doing!'
    gammastep -m randr -l 0:0 -t 2700:2700 &
fi
