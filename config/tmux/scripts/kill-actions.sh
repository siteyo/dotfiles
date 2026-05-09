#!/bin/bash

declare -a ACTIONS=(
  "Kill window:kill-window"
  "Kill pane:kill-pane"
)

action=$(printf '%s\n' "${ACTIONS[@]}" | cut -d: -f1 |
  fzf --reverse --ansi --prompt='Action> ' --no-info)

[ -z "$action" ] && exit 0

action_cmd=""
for item in "${ACTIONS[@]}"; do
  if [[ "$item" == "$action:"* ]]; then
    action_cmd="${item#*:}"
    break
  fi
done

[ -z "$action_cmd" ] && exit 1

case "$action_cmd" in
kill-window)
  tmux kill-window
  ;;
kill-pane)
  tmux kill-pane
  ;;
*)
  tmux display-message "Unknown action: $action_cmd"
  exit 1
  ;;
esac
