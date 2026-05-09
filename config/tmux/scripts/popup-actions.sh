#!/bin/bash

declare -a ACTIONS=(
  "New session:new-session"
  "New session (popup):new-session-popup"
  "Move window to new session:move-window-to-new-session"
  "Attach session (popup):attach-session-popup"
  "Neovim (popup):neovim-popup"
  "Join pane:join-pane"
  "Workmux Add:workmux-add"
  "Workmux Add (Gemini):workmux-add-gemini"
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
attach-session-popup)
  cur=$(tmux display -p "#{session_name}")
  sel=$(tmux ls -F '#S' | grep -v "^${cur}$" |
    fzf --reverse --ansi --prompt='Session> ' \
      --preview 'tmux capture-pane -ep -t {}' \
      --preview-window=down:70%)
  [ -z "$sel" ] && exit 0
  tmux attach-session -t "$sel"
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
workmux-add)
  workmux add -A
  ;;
workmux-add-gemini)
  read -rp "Branch name: " branch_name
  [ -z "$branch_name" ] && exit 0
  workmux add -a gemini "$branch_name"
  ;;
*)
  tmux display-message "Unknown action: $action_cmd"
  exit 1
  ;;
esac
