#!/bin/zsh

# Environment variables
# --------------------------------------------------------------------

## Default Editor
if builtin command -v nvim >/dev/null; then
  export EDITOR=nvim
else
  export EDITOR=vim
fi

## History
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE="${HOME}/.zsh_history"

## zsh-abbr
export ABBR_SET_EXPANSION_CURSOR=1

## fzf
# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

# Print tree structure in the preview window
export FZF_ALT_C_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'tree -C {}'"

export FZF_DEFAULT_COMMAND='fd --type f'

## Taskwarrior
export TASKRC=~/.config/task/.taskrc
export TASKDATA=~/.local/share/task
