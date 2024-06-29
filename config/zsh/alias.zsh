#!/bin/zsh

# Aliases
# --------------------------------------------------------------------
## eza
if [[ $(command -v eza) ]]; then
  alias ls='eza --icons --git'
  alias ll='eza --icons --git -l'
  alias llc='eza --icons --git -l -s changed'
  alias la='eza --icons --git -a'
  alias lal='eza --icons --git -al'
  alias lalc='eza --icons --git -al -s changed'
  alias lt='eza -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias ltl='eza -T -L 3 -a -I "node_modules|.git|.cache" -l --icons'
else
  alias ll='ls -l'
  alias la='ls -a'
  alias lal='ls -al'
fi

## cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

## WSL
if [[ $(uname -r) == *microsoft* ]]; then
  alias whome='cd $(wslpath $(wslvar USERPROFILE))'
fi

## bat
if command -v bat >/dev/null; then
  alias bat="bat --theme=\$(defaults read -globalDomain AppleInterfaceStyle &> /dev/null && echo Nord || echo GitHub)"
fi

# ## taskwarrior-tui
# if command -v taskwarrior-tui >/dev/null; then
#   alias tt="taskwarrior-tui"
# fi
