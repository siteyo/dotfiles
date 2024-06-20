#!/bin/zsh

_task_add_nvim() {
  local file desc
  file="${TASKDATA:-$XDG_DATA_HOME/task/}/Add.task"
  desc="# Please delete this sentence and write a description of the task."
  echo $desc | nvim - +"file $file"

  if grep -q $desc $file || [ ! -s $file ]; then
    print "Abort.\n\n"
  else
    print "\n"
    task add $(cat $file)
    print "\n"
  fi
  rm $file
  zle reset-prompt
}
zle -N _task_add_nvim
bindkey '^O' _task_add_nvim
