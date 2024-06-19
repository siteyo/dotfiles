#!/bin/bash

# shellcheck disable=SC1091

source "${CONFIG_DIR}/icons.sh"

PERCENTAGE="$(pmset -g batt | grep -Eo "\d+%" | cut -d% -f1)"
CHARGING="$(pmset -g batt | grep 'AC Power')"

if [ "$PERCENTAGE" = "" ]; then
  exit 0
fi

case "${PERCENTAGE}" in
9[0-9] | 100)
  ICON="${ICONS_BATTERY[4]}"
  ;;
[6-8][0-9])
  ICON="${ICONS_BATTERY[3]}"
  ;;
[3-5][0-9])
  ICON="${ICONS_BATTERY[2]}"
  ;;
[1-2][0-9])
  ICON="${ICONS_BATTERY[1]}"
  ;;
*) ICON="${ICONS_BATTERY[0]}" ;;
esac

if [ "$CHARGING" != "" ]; then
  ICON="$ICON_BATTERY_CHARGING $ICON"
fi

# The item invoking this script (name $NAME) will get its icon and label
# updated with the current battery status
sketchybar --set "$NAME" icon="$ICON" label="${PERCENTAGE}%"
