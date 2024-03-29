#!/bin/bash

main() {
  set -euo pipefail
  source "$(git rev-parse --show-toplevel)/scripts/util.sh"
  print_info '==> Install zsh ...'

  # Change current directory
  current_dir=$(dirname "${BASH_SOURCE[0]}")
  dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

  # Create directory
  mkdir -pv "${dotfiles_dir}/bak"
  mkdir -pv "${HOME}/.zsh-completions"

  # Create local config file
  touch "${HOME}/.zshrc.local"

  # Backup
  [ -f "${HOME}/.zshenv" ] &&
    mv -v "${HOME}/.zshenv" "${dotfiles_dir}/bak"
  [ -f "${HOME}/.zshrc" ] &&
    mv -v "${HOME}/.zshrc" "${dotfiles_dir}/bak"

  # Create symlinks
  ln -sfv "${dotfiles_dir}/etc/.zshenv" "${HOME}/.zshenv"

  # Install zsh
  if uname -a | grep -q microsoft; then
    sudo apt-get install zsh
  fi

  print_done
}

main
