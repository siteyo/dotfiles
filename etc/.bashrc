#!/bin/bash

# Environment variables
# --------------------------------------------------------------------
[ -d '/home/linuxbrew/.linuxbrew' ] && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

export EDITOR=nvim


# Completion
# --------------------------------------------------------------------
[ -e ~/.git-completion.bash ] && source ~/.git-completion.bash


# Aliaces
# --------------------------------------------------------------------

## eza
if [[ $(command -v eza) ]]; then
  alias ls='eza --icons --git'
  alias ll='eza --icons --git -l'
  alias la='eza --icons --git -a'
  alias lal='eza --icons --git -al'
  alias lt='eza -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias ltl='eza -T -L 3 -a -I "node_modules|.git|.cache" -l --icons'
fi

## cd
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

# Prompt
# --------------------------------------------------------------------
[ -e ~/.git-prompt.sh ] && source ~/.git-prompt.sh

add_line() {
  if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
    PS1_NEWLINE_LOGIN=true
  else
    printf '\n'
  fi
}

PROMPT_COMMAND="add_line"

GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\e[34m\]\w \[\e[37m\]$(__git_ps1)\[\033[00m\]\n\$ '


# Other
# --------------------------------------------------------------------
## terminal vi mode
set -o vi

## Load local settings
[ -f ~/.bashrc.local ] && source ~/.bashrc.local

## fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

export FZF_COMPLETION_TRIGGER='~~'
export FZF_COMPLETION_OPTS='--border --info=inline'

_fzf_compgen_path() {
  fd --hidden --follow --exclude ".git" . "$1"
}
_fzf_compgen_dir() {
  fd --type d --hidden --follow --exclude ".git" . "$1"
}

## zoxide
eval "$(zoxide init bash)"

## git
# fcoc - checkout git commit
fcoc() {
  local commits commit
  commits=$(git log --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e) &&
  git checkout $(echo "$commit" | sed "s/ .*//")
}

# fcs - get git commit sha
# example usage: git rebase -i `fcs`
fcs() {
  local commits commit
  commits=$(git log --color=always --pretty=oneline --abbrev-commit --reverse) &&
  commit=$(echo "$commits" | fzf --tac +s +m -e --ansi --reverse) &&
  echo -n $(echo "$commit" | sed "s/ .*//")
}

## Rust
# cargo
if [[ $(command -v exa) ]]; then
  . "$HOME/.cargo/env"
fi

## asdf
[ -f $(brew --prefix)/opt/asdf/libexec/asdf.sh ] && source $(brew --prefix)/opt/asdf/libexec/asdf.sh

## .local
export PATH="${HOME}/.local/bin:${PATH}"
