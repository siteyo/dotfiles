#!/bin/bash

# Environment variables
# --------------------------------------------------------------------
[ -d '/home/linuxbrew/.linuxbrew' ] && eval $(/home/linuxbrew/.linuxbrew/bin/brew shellenv)


# Completion
# --------------------------------------------------------------------
[ -e ~/.git-completion.bash ] && source ~/.git-completion.bash


# Aliaces
# --------------------------------------------------------------------
alias ll='ls -l'
alias la='ls -al'

alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias .....='cd ../../../..'

## Colored ls
if [ -x /usr/bin/dircolors ]; then
    test -r ~/.dircolors && eval "$(dircolors -b ~/.dircolors)" || eval "$(dircolors -b)"
    alias ls='ls --color=auto'
    alias grep='grep --color=auto'
fi

# Prompt
# --------------------------------------------------------------------
[ -e ~/.git-prompt.sh ] && source ~/.git-prompt.sh

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


# Other
# --------------------------------------------------------------------
## terminal vi mode
set -o vi

## Load local settings
[ -f ~/.bashrc.local ] && source ~/.bashrc.local

## fzf
[ -f ~/.fzf.bash ] && source ~/.fzf.bash

## anyenv
eval "$(anyenv init -)"

if command -v pyenv 1>/dev/null 2>&1; then
    eval "$(pyenv init -)"
fi

if command -v nodenv 1>/dev/null 2>&1; then
    eval "$(nodenv init -)"
fi

## z
. `brew --prefix`/etc/profile.d/z.sh
