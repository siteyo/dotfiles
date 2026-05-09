autoload -Uz edit-command-line
zle -N edit-command-line
bindkey -r "^J"
bindkey "^O" edit-command-line

if command -v ghq >/dev/null; then
  bindkey "^G" _ghq_src
  bindkey "^XG" list-expand
fi

if [[ -n $ZENO_LOADED ]]; then
  bindkey ' ' zeno-auto-snippet
  bindkey '^m' zeno-auto-snippet-and-accept-line
  bindkey '^i' zeno-completion

  bindkey '^e^m' accept-line
  bindkey '^e ' zeno-insert-space
  bindkey '^es' zeno-insert-snippet
  bindkey '^eo' zeno-toggle-auto-snippet

  bindkey '^ep' zeno-preprompt
  bindkey '^ee' zeno-preprompt-snippet
fi
