#!/bin/bash

# shellcheck disable=SC1091

source "${CONFIG_DIR}/icons.sh"

ORG_JSON_DIR="$HOME/.local/share/nvim/orgmode"
SCHEDULED_TODAY=$(jq '[.todo[] | select(.scheduled_today and .todo_type == "TODO" and .todo_value != "LOG" and .is_archived == false)]' "$ORG_JSON_DIR"/*.json | jq -s 'flatten | length')
SCHEDULED_OVERDUE=$(jq '[.todo[] | select(.scheduled_overdue and .todo_type == "TODO" and .todo_value != "LOG" and .is_archived == false)]' "$ORG_JSON_DIR"/*.json | jq -s 'flatten | length')
PENDING=$((SCHEDULED_TODAY + SCHEDULED_OVERDUE))

if [[ $PENDING == 0 ]]; then
  sketchybar --set "$NAME" drawing=off
else
  if [[ $SCHEDULED_OVERDUE == 0 ]]; then
    LABEL=$PENDING
  else
    LABEL="!$SCHEDULED_OVERDUE/$PENDING"
  fi
  sketchybar --set "$NAME" \
    icon="$ICON_TASK" \
    label="$LABEL" \
    icon.drawing=on \
    label.drawing=on \
    icon.padding_left=6 \
    icon.padding_right=2
fi
