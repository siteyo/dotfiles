#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${CONFIG_DIR}/icons.sh"

ORG_JSON_DIR="$HOME/.local/share/nvim/orgmode"
PLAN_TODAY=$(jq '[.plan[] | select(.date_today and .is_archived == false)]' "$ORG_JSON_DIR"/*.json | jq -s 'flatten | length')

if [[ $PLAN_TODAY == 0 ]]; then
  sketchybar --set "$NAME" drawing=off
else
  sketchybar --set "$NAME" \
    icon="$ICON_CALENDAR" \
    label="$PLAN_TODAY" \
    drawing=on \
    icon.padding_left=6 \
    icon.padding_right=2
fi
