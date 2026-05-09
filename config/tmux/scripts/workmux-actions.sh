#!/bin/bash

declare -a ACTIONS=(
  "Add:add-auto-name"
  "Add (Gemini):add-gemini"
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
add-auto-name)
  workmux add -A
  ;;
add-gemini)
  read -rp "Branch name: " branch_name
  [ -z "$branch_name" ] && exit 0
  workmux add -a gemini "$branch_name"
  ;;
*)
  tmux display-message "Unknown action: $action_cmd"
  exit 1
  ;;
esac
