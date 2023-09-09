#!/bin/bash

main() {
  set -euo pipefail
  source "$(git rev-parse --show-toplevel)/scripts/util.sh"
  print_info '==> Install git ...'

  local current_dir dotfiles_dir

  # Change current directory
  current_dir=$(dirname "${BASH_SOURCE[0]}")
  dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

  # Create directory
  mkdir -pv "${dotfiles_dir}/bak"

  # Move to backup directory or Create config file
  if [ -f "${HOME}/.gitconfig" ]; then
    mv -v "${HOME}/.gitconfig" "${dotfiles_dir}/bak"
  else
    touch "${HOME}/.gitconfig"
  fi

  git config --global include.path "${dotfiles_dir}/etc/.gitconfig"
  git config --global credential.helper store

  print_done
}

main
