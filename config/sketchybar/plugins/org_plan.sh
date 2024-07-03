#!/bin/bash

# shellcheck disable=SC1091

source "${CONFIG_DIR}/icons.sh"

ORG_JSON_DIR="$HOME/.local/share/nvim/orgmode"
PLAN_TODAY=$(jq '[.plan[] | select(.scheduled_today and .todo_type == "TODO" and .todo_value != "LOG" and .is_archived == false)]' "$ORG_JSON_DIR"/*.json | jq -s 'flatten | length')
PLAN_OVERDUE=$(jq '[.plan[] | select(.scheduled_overdue and .todo_type == "TODO" and .todo_value != "LOG" and .is_archived == false)]' "$ORG_JSON_DIR"/*.json | jq -s 'flatten | length')

PENDING=$((PLAN_TODAY + PLAN_OVERDUE))

if [[ $PENDING == 0 ]]; then
  sketchybar --set "$NAME" drawing=off
else
  if [[ $PLAN_OVERDUE == 0 ]]; then
    LABEL=$PENDING
  else
    LABEL="!$PLAN_OVERDUE/$PENDING"
  fi
  sketchybar --set "$NAME" \
    icon="$ICON_CALENDAR" \
    label="$LABEL" \
    icon.drawing=on \
    label.drawing=on \
    icon.padding_left=6 \
    icon.padding_right=2
fi
