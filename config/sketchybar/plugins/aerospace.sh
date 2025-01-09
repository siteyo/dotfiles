#!/usr/bin/env bash

# shellcheck disable=SC1091
source "$CONFIG_DIR/color.sh"
source "$CONFIG_DIR/icons.sh"

VISIBLE=$(aerospace list-workspaces --visible --monitor all)
NOEMPTY=$(aerospace list-workspaces --empty no --monitor all)
if printf '%s\n' "${VISIBLE[@]}" | grep -qx "$1"; then
  if [ "$1" = "$FOCUSED_WORKSPACE" ]; then
    sketchybar --set "$NAME" background.drawing=on background.color="$COLOR_CYAN"
  else
    sketchybar --set "$NAME" background.drawing=on background.color="$COLOR_RED"
  fi
elif printf '%s\n' "${NOEMPTY[@]}" | grep -qx "$1"; then
  sketchybar --set "$NAME" background.drawing=on background.color="$COLOR_FG"
else
  sketchybar --set "$NAME" background.drawing=off
fi
