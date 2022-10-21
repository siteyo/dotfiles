# Environment variables
# --------------------------------------------------------------------
# Homebrew for Linux (and WSL)
[ -d '/home/linuxbrew/.linuxbrew' ] \
  && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if builtin command -v nvim
then
  export EDITOR=nvim
else
  export EDITOR=vim
fi

## history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE=~/.zsh_history

# Options
# --------------------------------------------------------------------
setopt histignorealldups sharehistory
setopt auto_param_slash
setopt auto_menu
setopt auto_cd

bindkey -v

# Plugin (Sheldon)
# --------------------------------------------------------------------
eval "$(sheldon source)"

# zsh-syntax-highlighting
ZSH_HIGHLIGHT_HIGHLIGHTERS=(main brackets pattern)

# Prompt
# --------------------------------------------------------------------
# [[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# Completion
# --------------------------------------------------------------------
FPATH="$(brew --prefix)/share/zsh/site-functions:${FPATH}"

autoload -Uz compinit
compinit

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-colors ''
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Aliaces
# --------------------------------------------------------------------

## exa
if [[ $(command -v exa) ]]; then
  alias ls='exa --icons --git'
  alias ll='exa --icons --git -l'
  alias la='exa --icons --git -a'
  alias lal='exa --icons --git -al'
  alias lt='exa -T -L 3 -a -I "node_modules|.git|.cache" --icons'
  alias ltl='exa -T -L 3 -a -I "node_modules|.git|.cache" -l --icons'
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

# Other
# --------------------------------------------------------------------

## Fzf
[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh

## zoxide
eval "$(zoxide init zsh)"

## Git
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
if [[ $(command -v cargo) ]]; then
  . "$HOME/.cargo/env"
fi

## asdf
[ -f `brew --prefix`/opt/asdf/libexec/asdf.sh ] \
  && source `brew --prefix`/opt/asdf/libexec/asdf.sh

## thefuck
eval $(thefuck --alias)

## Starship
eval "$(starship init zsh)"
