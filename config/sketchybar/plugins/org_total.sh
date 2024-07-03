#!/bin/bash

# shellcheck disable=SC1091

source "${CONFIG_DIR}/icons.sh"

ORG_JSON_DIR="$HOME/.local/share/nvim/orgmode"
TOTAL=$(jq '[.todo[] | select(.todo_type == "TODO" and .todo_value != "LOG" and .is_archived == false)]' "$ORG_JSON_DIR"/*.json | jq -s 'flatten | length')

if [[ $TOTAL == 0 ]]; then
  sketchybar --set "$NAME" drawing=off
else
  sketchybar --set "$NAME" \
    icon="$ICON_LIST" \
    label="$TOTAL" \
    icon.drawing=on \
    label.drawing=on \
    icon.padding_left=6 \
    icon.padding_right=2
fi
