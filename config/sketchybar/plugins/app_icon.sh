#!/usr/bin/env bash

# shellcheck disable=SC1091
source "$CONFIG_DIR/icons.sh"

case "$1" in
"WezTerm" | "wezterm-gui")
  RESULT=$ICON_TERM
  if grep -q "btm" <<<"$2"; then
    RESULT=$ICON_CHART
  fi
  if grep -q "nvim" <<<"$2"; then
    RESULT=$ICON_NEOVIM
  fi
  if grep -q "lazygit" <<<"$2"; then
    RESULT=$ICON_GIT
  fi
  # if grep -q "taskwarrior-tui" <<<"$2"; then
  #   RESULT=$ICON_LIST
  # fi
  if grep -q "bat" <<<"$2"; then
    RESULT=$ICON_NOTE
  fi
  if grep -q "tty-clock" <<<"$2"; then
    RESULT=$ICON_CLOCK
  fi
  if grep -q "Yazi" <<<"$2"; then
    RESULT=$ICON_YAZI
  fi
  ;;
"Finder")
  RESULT=$ICON_FINDER
  ;;
"Weather")
  RESULT=$ICON_WEATHER
  ;;
"時計")
  RESULT=$ICON_CLOCK
  ;;
"Mail" | "Microsoft Outlook")
  RESULT=$ICON_MAIL
  ;;
"Calendar")
  RESULT=$ICON_CALENDAR
  ;;
"Calculator" | "Numi")
  RESULT=$ICON_CALC
  ;;
"Maps" | "Find My")
  RESULT=$ICON_MAP
  ;;
"Voice Memos")
  RESULT=$ICON_MICROPHONE
  ;;
"Slack")
  RESULT=$ICON_SLACK
  ;;
"Microsoft Teams")
  RESULT=$ICON_TEAMS
  ;;
"Messages" | "Discord")
  RESULT=$ICON_CHAT
  ;;
"FaceTime" | "zoom.us")
  RESULT=$ICON_VIDEOCHAT
  ;;
"Microsoft Word")
  RESULT=$ICON_WORD
  ;;
"Microsoft Excel")
  RESULT=$ICON_EXCEL
  ;;
"Notes" | "TextEdit" | "Stickies")
  RESULT=$ICON_NOTE
  ;;
"Reminders" | "Microsoft OneNote")
  RESULT=$ICON_LIST
  ;;
"Photo Booth")
  RESULT=$ICON_CAMERA
  ;;
"Google Chrome")
  RESULT=$ICON_CHROME
  ;;
"Safari" | "Beam" | "DuckDuckGo" | "Arc" | "Microsoft Edge" | "Firefox")
  RESULT=$ICON_WEB
  ;;
"システム設定" | "システム環境設定")
  RESULT=$ICON_COG
  ;;
"HOME")
  RESULT=$ICON_HOMEAUTOMATION
  ;;
"Music" | "Spotify")
  RESULT=$ICON_MUSIC
  ;;
"Podcasts")
  RESULT=$ICON_PODCAST
  ;;
"Books")
  RESULT=$ICON_BOOK
  ;;
"Xcode" | "Code" | "Neovide" | "IntelliJ IDEA")
  RESULT=$ICON_DEV
  ;;
"Font Book" | "Dictionary")
  RESULT=$ICON_BOOKINFO
  ;;
"アクティビティモニタ")
  RESULT=$ICON_CHART
  ;;
"ディスクユーティリティ")
  RESULT=$ICON_DISK
  ;;
"Screenshot" | "プレビュー")
  RESULT=$ICON_PREVIEW
  ;;
"Microsoft PowerPoint")
  RESULT=$ICON_POWERPOINT
  ;;
"OneDrive")
  RESULT=$ICON_ONEDRIVE
  ;;
*)
  RESULT=$ICON_APP
  ;;
esac

echo "$RESULT"
