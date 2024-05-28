#!/bin/bash

# Required parameters:
# @raycast.schemaVersion 1
# @raycast.title Wezterm - Neovim
# @raycast.mode silent

# Optional parameters:
# @raycast.icon ⚡

export LC_ALL="${LC_ALL:-en_US.UTF-8}"
export LANG="${LANG:-en_US.UTF-8}"
export XDG_DATA_HOME="${XDG_DATA_HOME:-$HOME/.local/share}"

if command -v mise >/dev/null; then
  eval "$(mise activate zsh)"
fi

if [ -d "${HOME}/.rye" ]; then
  source "${HOME}/.rye/env"
fi

if command -v aqua >/dev/null; then
  export PATH="${AQUA_ROOT_DIR:-${XDG_DATA_HOME:-$HOME/.local/share}/aquaproj-aqua}/bin:$PATH"
  export AQUA_GLOBAL_CONFIG="${HOME}/.config/aqua/aqua.yaml"
  aqua i -l -a
fi

wezterm cli spawn --new-window -- nvim
