# Environment variables
# --------------------------------------------------------------------
export PATH="${HOME}/.local/bin:${PATH}"
export COMPLETIONS_PATH="${HOME}/.zsh-completions"

## History
# --------------------------------------------------------------------
export HISTSIZE=1000
export SAVEHIST=1000
export HISTFILE="${HOME}/.zsh_history"

## Homebrew
# --------------------------------------------------------------------
# for Linux (and WSL)
[ -d '/home/linuxbrew/.linuxbrew' ] &&
    eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

# for macOS
if [ -f '/opt/homebrew/bin/brew' ]; then
    eval "$(/opt/homebrew/bin/brew shellenv)"
elif [ -f '/usr/local/bin/brew' ]; then
    eval "$(/usr/local/bin/brew shellenv)"
fi

## Default Editor
# --------------------------------------------------------------------
if builtin command -v nvim >/dev/null; then
    export EDITOR=nvim
else
    export EDITOR=vim
fi

export HOMEBREW_PREFIX="$(brew --prefix)"

## fzf
# --------------------------------------------------------------------
export FZF_DEFAULT_COMMAND='fd --type f'

# Preview file content using bat (https://github.com/sharkdp/bat)
export FZF_CTRL_T_OPTS="
  --walker-skip .git,node_modules,target
  --preview 'bat -n --color=always {}'
  --bind 'ctrl-/:change-preview-window(down|hidden|)'"

# CTRL-/ to toggle small preview window to see the full command
# CTRL-Y to copy the command into clipboard using pbcopy
export FZF_CTRL_R_OPTS="
  --preview 'echo {}' --preview-window up:3:hidden:wrap
  --bind 'ctrl-/:toggle-preview'
  --bind 'ctrl-y:execute-silent(echo -n {2..} | pbcopy)+abort'
  --color header:italic
  --header 'Press CTRL-Y to copy command into clipboard'"

## zeno
# --------------------------------------------------------------------
export ZENO_HOME="${XDG_CONFIG_HOME}/zeno"
export ZENO_GIT_CAT="bat --color=always"
export ZENO_GIT_TREE="eza --tree"

## nb
# --------------------------------------------------------------------
export NBRC_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/nb/.nbrc"
