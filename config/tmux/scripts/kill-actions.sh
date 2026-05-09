#!/bin/bash

declare -a ACTIONS=(
  "Kill window(s):kill-windows"
  "Kill pane(s):kill-panes"
)

action=$(printf '%s\n' "${ACTIONS[@]}" | cut -d: -f1 |
  fzf --reverse --ansi --prompt='Select Action> ' --no-info)

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
kill-windows)
  tmux kill-window
  ;;
kill-panes)
  tmux kill-pane
  ;;
*)
  tmux display-message "Unknown action: $action_cmd"
  exit 1
  ;;
esac
