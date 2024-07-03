#!/bin/bash

# shellcheck disable=SC1091

source "${CONFIG_DIR}/icons.sh"

ORG_JSON_DIR="$HOME/.local/share/nvim/orgmode"
DEADLINE_TODAY=$(jq '[.todo[] | select(.deadline_today and .todo_type == "TODO" and .is_archived == false)]' "$ORG_JSON_DIR"/*.json | jq -s 'flatten | length')
DEADLINE_OVERDUE=$(jq '[.todo[] | select(.deadline_overdue and .todo_type == "TODO" and .is_archived == false)]' "$ORG_JSON_DIR"/*.json | jq -s 'flatten | length')
PENDING=$((DEADLINE_TODAY + DEADLINE_OVERDUE))

if [[ $PENDING == 0 ]]; then
  sketchybar --set "$NAME" \
    label.drawing=off \
    icon.drawing=off \
    icon.padding_left=4 \
    icon.padding_right=4
else
  if [[ $DEADLINE_OVERDUE == 0 ]]; then
    LABEL=$PENDING
  else
    LABEL="!$DEADLINE_OVERDUE/$PENDING"
  fi
  sketchybar --set "$NAME" \
    icon="$ICON_DEADLINE" \
    label="$LABEL" \
    icon.drawing=on \
    label.drawing=on \
    icon.padding_left=6 \
    icon.padding_right=2
fi
