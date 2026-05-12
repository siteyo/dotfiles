#!/bin/bash

declare -a ACTIONS=(
  "New session:new-session"
  "New session (popup):new-session-popup"
  "Move window to new session:move-window-to-new-session"
  "Neovim (popup):neovim-popup"
  "Join pane:join-pane"
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
new-session)
  read -rp "Session name: " session_name
  [ -z "$session_name" ] && exit 0
  tmux new-session -d -s "$session_name"
  tmux switch-client -t "$session_name"
  ;;
new-session-popup)
  read -rp "Session name: " session_name
  [ -z "$session_name" ] && exit 0
  tmux new-session -d -s "$session_name"
  tmux attach-session -t "$session_name"
  ;;
move-window-to-new-session)
  read -rp "Session name: " session_name
  [ -z "$session_name" ] && exit 0
  window_name=$(tmux display -p "#{window_name}")
  tmux new-session -d -s "$session_name"
  tmux move-window -s "$window_name" -t "$session_name"
  tmux switch-client -t "$session_name"
  ;;
neovim-popup)
  nvim
  ;;
join-pane)
  cur=$(tmux display -p "#{session_name}:#{window_index}.#{pane_index}")
  sel=$(tmux list-panes -a -F "#{session_name}:#{window_index}.#{pane_index}|#{session_name} / #{window_name} (#{pane_current_command})" |
    grep -vF "$cur|" |
    fzf --reverse --ansi --prompt="Pane> " \
      --delimiter="|" --with-nth=2 \
      --preview "tmux capture-pane -ep -t {1}" \
      --preview-window=down:70%)
  [ -z "$sel" ] && exit 0
  target=$(echo "$sel" | cut -d"|" -f1)
  tmux join-pane -s "$target"
  ;;
*)
  tmux display-message "Unknown action: $action_cmd"
  exit 1
  ;;
esac
