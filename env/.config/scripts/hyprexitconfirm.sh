#!/bin/bash

# Show a quit confirmation dialog
zenity --question \
    --title="Confirm Logout" \
    --text="Do you really want to log out?" \
    --ok-label="Logout" \
    --cancel-label="Cancel"

# Check the response
if [ $? -eq 0 ]; then
    hyprctl dispatch exit
fi

