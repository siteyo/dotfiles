#!/bin/bash

main() {
  set -euo pipefail
  source "$(git rev-parse --show-toplevel)/scripts/util.sh"
  print_info '==> Install wezterm ...'

  local current_dir dotfiles_dir winhome

  # Change current directory
  current_dir=$(dirname "${BASH_SOURCE[0]}")
  dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

  if uname -a | grep -q microsoft; then
    winhome="$(wslpath "$(wslvar USERPROFILE)")"
    mkdir -pv "${winhome}/.config/wezterm"
    cp -fv "${dotfiles_dir}/config/wezterm/wezterm.lua" "${winhome}/.config/wezterm/wezterm.lua"
  fi

  print_done
}

main
