#!/bin/bash

main() {
  set -euo pipefail
  echo '==> Install vim ...'

  local current_dir dotfiles_dir

  # Change current directory
  current_dir=$(dirname "${BASH_SOURCE[0]}")
  dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

  # Create directories
  mkdir -pv "${HOME}/.vim"
  mkdir -pv "${HOME}/.vim/backup"
  mkdir -pv "${HOME}/.vim/swap"
  mkdir -pv "${HOME}/.vim/undo"

  # Create a local setting file
  touch "${HOME}/.vim/local_vimrc.vim"

  # Create symbolic links
  ln -sfv "${dotfiles_dir}/vim/vimrc" "${HOME}/.vimrc"

  # Install plugins
  vim +PlugInstall +qall

  echo ''
}

main
