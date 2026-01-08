# _task_add_nvim() {
#   local file desc
#   file="${TASKDATA:-$XDG_DATA_HOME/task/}/Add.task"
#   desc="# Please delete this sentence and write a description of the task."
#   echo $desc | nvim - +"file $file"
#
#   if grep -q $desc $file || [ ! -s $file ]; then
#     print "Abort.\n\n"
#   else
#     print "\n"
#     task add $(cat $file)
#     print "\n"
#   fi
#   rm $file
#   zle reset-prompt
# }
# zle -N _task_add_nvim
# bindkey '^O' _task_add_nvim

## ghq
_ghq_src() {
  local selected_dir=$(ghq list | fzf --prompt="repo > " --layout="reverse" --query="$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd $(ghq root)/${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N _ghq_src

## mb notes
_nb_notes() {
  local selected_note=$(nb list --no-color | fzf --prompt="Select note > " --layout="reverse")
  if [ -z "$selected_note" ]; then
    echo "No note selected"
    zle reset-prompt
    return 1
  fi

  local selected_note_id=$(echo "$selected_note" | sed -E 's/^[^[]*\[([^]]+)\].*$/\1/')
  BUFFER="nb edit $selected_note_id"
  zle accept-line
  zle clear-screen
}
zle -N _nb_notes

## nb tags
_nb_tags() {
  local tags=$(nb --no-color --tags | sed 's/^#//g')
  local selected_tag=$(echo "$tags" | fzf --prompt="Select tag > " --layout="reverse")
  if [ -z "$selected_tag" ]; then
    echo "No tag selected"
    zle reset-prompt
    return 1
  fi

  local notes=$(nb --no-color --tag "$selected_tag")
  local selected_note=$(echo "$notes" | fzf --prompt="Select note > " --layout="reverse")
  if [ -z "$selected_note" ]; then
    echo "No note selected"
    zle reset-prompt
    return 1
  fi

  local selected_note_id=$(echo "$selected_note" | sed -E 's/^[^[]*\[([^]]+)\].*$/\1/')
  BUFFER="nb edit $selected_note_id"
  zle accept-line
  zle clear-screen
}
zle -N _nb_tags
