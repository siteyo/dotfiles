# git
source /usr/local/etc/bash_completion.d/git-prompt.sh
source /usr/local/etc/bash_completion.d/git-completion.bash

# alias
alias ls='ls -G'
alias ll='ls -lG'
alias la='ls -laG'

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
