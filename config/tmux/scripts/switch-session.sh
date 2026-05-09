#!/bin/bash

cur=$(tmux display-message -p '#S')
sel=$(tmux ls -F '#S' | grep -v "^${cur}$" |
  fzf --reverse --ansi --prompt='Session> ' \
    --preview 'tmux capture-pane -ep -t {}' \
    --preview-window=down:70%)
[ -z "$sel" ] && exit 0
tmux switch-client -t "$sel"
