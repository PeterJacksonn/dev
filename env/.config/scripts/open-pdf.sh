#!/usr/bin/env bash

DIRS=(
    # for PC:
    "$HOME/Downloads"
    "$HOME/personal/sync/work"

    # For laptop:
    "$HOME/Sync"
)

selected=$(
  fd -i -e pdf -e epub -e djvu . "${DIRS[@]}" \
  | sed "s|^$HOME/||" \
  | fzf
)

[[ -z "$selected" ]] && exit 0

setsid -f sioyek "$HOME/$selected"
