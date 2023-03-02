#!/bin/bash

main() {
  set -euo pipefail
  echo '==> Install ... '

  local current_dir dotfiles_dir

  # Change current directory
  current_dir=$(dirname "${BASH_SOURCE[0]}")
  dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

  # Create directory
  mkdir -pv "${dotfiles_dir}/bak"

  # Move to backup directory
  [ -d "${HOME}/.config" ] &&
    mv -v "${HOME}/.config" "${dotfiles_dir}/bak"

  # Create symbolic link
  ln -sfv "${dotfiles_dir}/config" "${HOME}/.config"

  echo ''
}

main
