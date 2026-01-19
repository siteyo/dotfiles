autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^O" edit-command-line

if command -v ghq >/dev/null; then
  bindkey "^G" _ghq_src
  bindkey "^XG" list-expand
fi

if command -v nb >/dev/null; then
  bindkey "^E^E" _nb_notes
  bindkey "^E^T" _nb_tags
  bindkey "^E^N" _nb_notebooks
fi
