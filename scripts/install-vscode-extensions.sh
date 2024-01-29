#!/bin/bash

main() {
  set -euo pipefail
  source "$(git rev-parse --show-toplevel)/scripts/util.sh"
  print_info 'Install Visual Studio Code settings and extensions ...'

  local current_dir dotfiles_dir

  current_dir=$(dirname "${BASH_SOURCE[0]}")
  dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

  local settings_json keybindings_json
  settings_json="${HOME}/Library/Application Support/Code/User/settings.json"
  keybindings_json="${HOME}/Library/Application Support/Code/User/keybindings.json"

  # Move to backup directory
  if [ -f "${settings_json}" ]; then
    mv -v "${settings_json}" "${dotfiles_dir}/bak/settings.json"
  fi
  if [ -f "${keybindings_json}" ]; then
    mv -v "${keybindings_json}" "${dotfiles_dir}/bak/keybindings.json"
  fi

  # Create a symbolic link
  if [ "$(uname)" == 'Darwin' ]; then
    ln -sfv "${dotfiles_dir}/config/vscode/settings.json" "$settings_json"
    ln -sfv "${dotfiles_dir}/config/vscode/keybindings.json" "${keybindings_json}"
  fi

  print_done
}

main
