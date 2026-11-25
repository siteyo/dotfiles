#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${CONFIG_DIR}/icons.sh"

NOTES_DIR="$HOME/notes"
COUNT=$(rg -l "^  - effort/ongoing$" -g "!x/" "$NOTES_DIR" | wc -l | tr -d ' ')

if [[ $COUNT == 0 ]]; then
  sketchybar --set "$NAME" drawing=off
else
  sketchybar --set "$NAME" \
    icon="$ICON_ONGOING" \
    label="$COUNT" \
    drawing=on
fi
