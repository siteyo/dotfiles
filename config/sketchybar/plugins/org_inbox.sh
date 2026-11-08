#!/usr/bin/env bash

# shellcheck disable=SC1091

source "${CONFIG_DIR}/icons.sh"

ORG_JSON_DIR="$HOME/.local/share/nvim/orgmode"
INBOX_JSON="$ORG_JSON_DIR/inbox.json"
if [[ -f $INBOX_JSON ]]; then
  INBOX_TOTAL=$(jq '(.todo | length) + (.plan | length)' "$INBOX_JSON")
else
  INBOX_TOTAL=0
fi

if [[ $INBOX_TOTAL == 0 ]]; then
  sketchybar --set "$NAME" drawing=off
else
  sketchybar --set "$NAME" \
    icon="$ICON_INBOX" \
    label="$INBOX_TOTAL" \
    drawing=on \
    icon.padding_left=6 \
    icon.padding_right=2
fi
