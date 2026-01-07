autoload -Uz edit-command-line
zle -N edit-command-line
bindkey "^O" edit-command-line
bindkey "^G" _ghq_src
bindkey "^XG" list-expand
