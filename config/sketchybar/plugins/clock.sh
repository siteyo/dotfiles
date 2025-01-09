#!/usr/bin/env bash

# The $NAME variable is passed from sketchybar and holds the name of
# the item invoking this script:
# https://felixkratz.github.io/SketchyBar/config/events#events-and-scripting

# shellcheck disable=SC1091
source "${CONFIG_DIR}/icons.sh"

sketchybar --set "$NAME" icon="$ICON_CLOCK" label="$(date '+%Y/%m/%d(%a) %H:%M')"
