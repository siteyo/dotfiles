#!/bin/bash

# git
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

# alias
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

#terminal
function add_line {
    if [[ -z "${PS1_NEWLINE_LOGIN}" ]]; then
        PS1_NEWLINE_LOGIN=true
    else
        printf '\n'
    fi
}

PROMPT_COMMAND="add_line"

GIT_PS1_SHOWDIRTYSTATE=true
PS1='\[\e[34m\]\w \[\e[37m\]$(__git_ps1)\[\033[00m\]\n\$ '

# terminal vi mode
set -o vi

# Load local settings
. ~/.bashrc.local

# fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

# anyenv
if [ -x $HOME/.anyenv/bin/anyenv ]; then
  export PATH="$HOME/.anyenv/bin:$PATH"
fi
eval "$(anyenv init -)"

# poetry
export PATH="$HOME/.poetry/bin:$PATH"

# docui
export LC_CTYPE=en_US.UTF-8
export TERM=xterm-256color
