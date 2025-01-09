#!/usr/bin/env bash

# shellcheck disable=SC1091
source "$CONFIG_DIR/color.sh"
source "$CONFIG_DIR/icons.sh"

STATUS_LABEL=$(lsappinfo info -only StatusLabel "Slack")
if [[ $STATUS_LABEL =~ \"label\"=\"([^\"]*)\" ]]; then
  LABEL="${BASH_REMATCH[1]}"

  if [[ $LABEL == "" ]]; then
    ICON_COLOR=$COLOR_CYAN
  elif [[ $LABEL == "•" ]]; then
    ICON_COLOR=$COLOR_YELLOW
  elif [[ $LABEL =~ ^[0-9]+$ ]]; then
    ICON_COLOR=$COLOR_RED
  else
    exit 0
  fi
  sketchybar --set "${NAME}" icon="${ICON_SLACK}" label="${LABEL}" icon.color="${ICON_COLOR}" drawing=on
else
  sketchybar --set "${NAME}" drawing=off
  exit 0
fi

# sketchybar --set "${NAME}" icon="${ICON_SLACK}" label="${LABEL}" icon.color="${ICON_COLOR}"
