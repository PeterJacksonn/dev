#!/usr/bin/env bash

DIRS=(
    "$HOME/Downloads"
    "$HOME/personal/sync/work"
)

selected=$(
  fd -i -e pdf -e epub -e djvu . "${DIRS[@]}" \
  | sed "s|^$HOME/||" \
  | fzf
)

[[ -z "$selected" ]] && exit 0

setsid -f zathura "$HOME/$selected"
