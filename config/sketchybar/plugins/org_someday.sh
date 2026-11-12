#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${CONFIG_DIR}/icons.sh"

ORG_JSON_DIR="$HOME/.local/share/nvim/orgmode"
SOMEDAY=$(jq '[.todo[] | select(.todo_value == "SOMEDAY")]' "$ORG_JSON_DIR"/*.json | jq -s 'flatten | length')

if [[ $SOMEDAY == 0 ]]; then
  sketchybar --set "$NAME" drawing=off
else
  sketchybar --set "$NAME" \
    icon="$ICON_SOMEDAY" \
    label="$SOMEDAY" \
    drawing=on \
    icon.padding_left=6 \
    icon.padding_right=2
fi
