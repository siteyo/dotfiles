#!/bin/bash

# shellcheck disable=SC1091

source "${CONFIG_DIR}/icons.sh"

ORG_JSON_DIR="$HOME/.local/share/nvim/orgmode"
DEADLINE_WARN=$(jq '[.todo[] | select(.deadline_warning and .todo_type == "TODO" and .todo_value != "LOG" and .is_archived == false)]' "$ORG_JSON_DIR"/*.json | jq -s 'flatten | length')
DEADLINE_OVERDUE=$(jq '[.todo[] | select(.deadline_overdue and .todo_type == "TODO" and .todo_value != "LOG" and .is_archived == false)]' "$ORG_JSON_DIR"/*.json | jq -s 'flatten | length')

if [[ $DEADLINE_WARN == 0 ]]; then
  sketchybar --set "$NAME" drawing=off
else
  if [[ $DEADLINE_OVERDUE == 0 ]]; then
    LABEL=$DEADLINE_WARN
  else
    LABEL="!$DEADLINE_OVERDUE/$DEADLINE_WARN"
  fi
  sketchybar --set "$NAME" \
    icon="$ICON_DEADLINE" \
    label="$LABEL" \
    drawing=on \
    icon.padding_left=6 \
    icon.padding_right=2
fi
