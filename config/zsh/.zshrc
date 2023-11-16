# Environment variables
# --------------------------------------------------------------------
# Homebrew for Linux (and WSL)
[ -d '/home/linuxbrew/.linuxbrew' ] \
  && eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

if builtin command -v nvim > /dev/null
then
  export EDITOR=nvim
else
  export EDITOR=vim
fi

## history
HISTSIZE=1000
SAVEHIST=1000
HISTFILE="${HOME}/.zsh_history"

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
[ -f "${ZDOTDIR}/.p10k.zsh" ] && source "${ZDOTDIR}/.p10k.zsh"

# Completion
# --------------------------------------------------------------------
FPATH="$(brew --prefix)/share/zsh/site-functions:${COMPLETIONS_PATH}:${FPATH}"

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

if [[ $(uname -r) == *microsoft* ]]; then
  alias whome='cd $(wslpath $(wslvar USERPROFILE))'
fi

# Other
# --------------------------------------------------------------------

## Fzf
[ -f "${HOME}/.fzf.zsh" ] \
  && source "${HOME}/.fzf.zsh"

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

# aqua cli version manager
if command -v aqua > /dev/null; then
  export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
  export AQUA_GLOBAL_CONFIG="${HOME}/.config/aqua/aqua.yaml"
  aqua i -l -a
fi

## cargo (Rust)
if [ -d "${HOME}/.cargo" ]; then
  source "${HOME}/.cargo/env"
  [ ! -f "${COMPLETIONS_PATH}/_rustup" ] &&
    $(command -v rustup) completions zsh >"${COMPLETIONS_PATH}/_rustup"
  [ ! -f "${COMPLETIONS_PATH}/_cargo" ] &&
    $(command -v rustup) completions zsh cargo >"${COMPLETIONS_PATH}/_cargo"
fi

## volta (Node.js)
if [ -d "${HOME}/.volta" ]; then
  export VOLTA_HOME="$HOME/.volta"
  export PATH="$VOLTA_HOME/bin:$PATH"
  [ ! -f "${COMPLETIONS_PATH}/_volta" ] &&
    $(command -v volta) completions zsh >"${COMPLETIONS_PATH}/_volta"

fi

## rye (Python)
if [ -d "${HOME}/.rye" ]; then
  source "${HOME}/.rye/env"
  [ ! -f "${COMPLETIONS_PATH}/_rye" ] &&
    $(command -v rye) self completion -s zsh >"${COMPLETIONS_PATH}/_rye"
fi

## Local settings
source "${HOME}/.zshrc.local"
