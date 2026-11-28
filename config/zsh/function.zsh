# ghq
_ghq_src() {
  local selected_dir=$(ghq list | fzf --prompt="repo > " --layout="reverse" --query="$LBUFFER")
  if [ -n "$selected_dir" ]; then
    BUFFER="cd $(ghq root)/${selected_dir}"
    zle accept-line
  fi
  zle clear-screen
}
zle -N _ghq_src

# qmd
qq() {
  local line file hit errlog
  errlog=$(mktemp)
  line=$(qmd query "$*" --all --json --full-path 2>"$errlog" |
    jq -r '.[] | [(if (.title // "") == "" then (.file | split("/") | .[-1]) else .title end), .file, (.line // 1)] | @tsv' |
    fzf --delimiter=$'\t' --with-nth=1 --prompt='qmd> ' \
      --preview 'bat --color=always --style=numbers --paging=never --highlight-line {3} {2}' \
      --preview-window='right,60%,wrap,+{3}-5')
  if [ -z "$line" ]; then
    [ -s "$errlog" ] && cat "$errlog" >&2
    rm -f "$errlog"
    return 0
  fi
  rm -f "$errlog"

  file=$(printf '%s' "$line" | cut -f2)
  hit=$(printf '%s' "$line" | cut -f3)
  if [ -f "$file" ]; then
    case "${EDITOR:-nvim}" in
    *nvim* | *vim* | *vi) ${EDITOR:-nvim} "+$hit" "$file" ;;
    *) ${EDITOR:-nvim} "$file" ;;
    esac
  else
    echo "qs: file not found: $file" >&2
    return 1
  fi
}
