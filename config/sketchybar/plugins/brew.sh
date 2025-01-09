#!/usr/bin/env bash

# shellcheck disable=SC1091
source "${CONFIG_DIR}/icons.sh"

if command -v brew >/dev/null; then
  brew update &>/dev/null
  BREW_LIST=$(brew outdated)

  if [[ $BREW_LIST == "" ]]; then
    BREW='0'
    BREW_LIST=""
  else
    BREW=$(echo "$BREW_LIST" | wc -l | tr -d ' ')
  fi

fi

ICON="$ICON_PACKAGE"

if [ "$BREW" = '0' ]; then
  sketchybar --set "$NAME" drawing=off
else
  sketchybar --set "$NAME" icon="$ICON" label="$BREW" drawing=on
fi
