# Minimum environment variables
# --------------------------------------------------------------------
export LC_ALL="${LC_ALL:-en_US.UTF-8}"
export LANG="${LANG:-en_US.UTF-8}"
export XDG_CONFIG_HOME="${XDG_CONFIG_HOME:-$HOME/.config}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"
export XDG_CACHE_HOME="${XDG_CACHE_HOME:-$HOME/.cache}"
export ZDOTDIR="${XDG_CONFIG_HOME}/zsh"
export PATH="${HOME}/.local/bin:${PATH}"
export COMPLETIONS_PATH="${HOME}/.zsh-completions"
