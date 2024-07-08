#!/bin/bash

# shellcheck disable=SC1091

source "${CONFIG_DIR}/icons.sh"

ORG_JSON_DIR="$HOME/.local/share/nvim/orgmode"
CLOCKIN_TITLE=$(jq -r '.todo + .plan | .[] | select(.clocked_in) | .title' "$ORG_JSON_DIR"/*.json)

TITLE_MAX_LEN=15
if [ ${#CLOCKIN_TITLE} -gt $TITLE_MAX_LEN ]; then
  CLOCKIN_TITLE=$(echo "$CLOCKIN_TITLE" | cut -c 1-"$TITLE_MAX_LEN")~~
fi
echo "$CLOCKIN_TITLE"

if [[ ${#CLOCKIN_TITLE} == 0 ]]; then
  sketchybar --set "$NAME" drawing=off
else
  sketchybar --set "$NAME" \
    icon="$ICON_PEN" \
    label="$CLOCKIN_TITLE" \
    drawing=on \
    icon.padding_left=6 \
    icon.padding_right=2
fi
