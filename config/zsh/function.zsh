### ghq
_ghq_src() {
  local selected_dir=$(ghq list | fzf --prompt="repo > " --layout="reverse" --query="$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd $(ghq root)/${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N _ghq_src
