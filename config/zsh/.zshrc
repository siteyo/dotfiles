# Options
# --------------------------------------------------------------------
## History
setopt histignorealldups
setopt sharehistory

## Completion / Input
setopt auto_param_slash
setopt auto_menu
setopt auto_cd

# Completion
# --------------------------------------------------------------------
for dir in \
  "$HOMEBREW_PREFIX/share/zsh/site-functions" \
  "$COMPLETIONS_PATH"
do
  [[ -d $dir && ${FPATH[(Ie)$dir]} -eq 0 ]] && FPATH="$dir:$FPATH"
done

autoload -Uz compinit
compinit -C

zstyle ':completion:*' auto-description 'specify: %d'
zstyle ':completion:*' completer _expand _complete _correct _approximate
zstyle ':completion:*' format '%B%F{blue}%d%f%b'
zstyle ':completion:*' group-name ''
zstyle ':completion:*' menu select=2
zstyle ':completion:*' list-colors ${(s.:.)LS_COLORS}
zstyle ':completion:*' list-prompt %SAt %p: Hit TAB for more, or the character to insert%s
zstyle ':completion:*' matcher-list '' 'm:{a-z}={A-Z}' 'm:{a-zA-Z}={A-Za-z}' 'r:|[._-]=* r:|=* l:|=*'
zstyle ':completion:*' select-prompt %SScrolling active: current selection at %p%s
zstyle ':completion:*' use-compctl false
zstyle ':completion:*' verbose true

zstyle ':completion:*:*:kill:*:processes' list-colors '=(#b) #([0-9]#)*=0=01;31'
zstyle ':completion:*:kill:*' command 'ps -u $USER -o pid,%cpu,tty,cputime,cmd'

# Setup Sheldon
# --------------------------------------------------------------------
eval "$(sheldon source)"

## Local settings
# --------------------------------------------------------------------
source "${HOME}/.zshrc.local"
