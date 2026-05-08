#!/bin/bash

cur=$(tmux display-message -p '#S')
sel=$(tmux ls -F '#S' | grep -vFx "$cur" |
  fzf -m --reverse --ansi --prompt='kill> ' \
    --header='Tab = multi-select, Enter = kill' \
    --preview 'tmux capture-pane -ep -t {}' \
    --preview-window=down:70%)
[ -z "$sel" ] && exit 0
echo "$sel" | xargs -rI {} tmux kill-session -t {}
tmux display-message "killed $(echo "$sel" | wc -l | tr -d ' ') session(s)"
