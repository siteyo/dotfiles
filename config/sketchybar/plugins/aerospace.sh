#!/usr/bin/env bash

# shellcheck disable=SC1091,SC1083
source "$CONFIG_DIR/color.sh"
source "$CONFIG_DIR/icons.sh"

# Dual monitor support only
FOCUSED_MONITOR=$(aerospace list-monitors --focused --format %{monitor-id})
UNFOCUSED_MONITOR=$(aerospace list-monitors --focused no --format %{monitor-id})

VISIBLE=$(aerospace list-workspaces --visible --monitor all)
NOEMPTY=$(aerospace list-workspaces --empty no --monitor all --format m%{monitor-id}w%{workspace})
if printf '%s\n' "${VISIBLE[@]}" | rg -qx "$1"; then
  if [ "$1" = "$FOCUSED_WORKSPACE" ] || [ -z "${FOCUSED_WORKSPACE}" ]; then
    sketchybar --set "$NAME" background.drawing=on background.color="$COLOR_CYAN"
  else
    sketchybar --set "$NAME" background.drawing=on background.color="$COLOR_RED"
  fi
elif printf '%s\n' "${NOEMPTY[@]}" | rg -qx "m${FOCUSED_MONITOR}w$1"; then
  sketchybar --set "$NAME" background.drawing=on background.color="$COLOR_FG"
elif printf '%s\n' "${NOEMPTY[@]}" | rg -qx "m${UNFOCUSED_MONITOR}w$1"; then
  sketchybar --set "$NAME" background.drawing=on background.color="$COLOR_RED"
else
  sketchybar --set "$NAME" background.drawing=off
fi
