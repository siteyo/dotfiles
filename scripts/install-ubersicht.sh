#!/bin/bash

#/Users/SaitoYuki/Library/Application Support/Übersicht/widgets

main() {
  set -euo pipefail
  source "$(git rev-parse --show-toplevel)/scripts/util.sh"
  print_info '==> Install Ubersicht and setup widgets ...'

  # Change current directory
  local current_dir dotfiles_dir
  current_dir=$(dirname "${BASH_SOURCE[0]}")
  dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

  # Create directtory
  mkdir -pv "${dotfiles_dir}/bak"

  # Move to backup directory
  [ -f "${dotfiles_dir}/.simplebarrc" ] &&
    rm -f "${dotfiles_dir}/.simplebarrc"
  [ -f "${HOME}/.simplebarrc" ] &&
    mv -v "${HOME}/.simplebarrc" "${dotfiles_dir}/bak"

  # Clone simple-bar
  local widgets_folder
  widgets_folder="${HOME}/Library/Application Support/Übersicht/widgets"
  [ ! -d "${widgets_folder}" ] &&
    git cone https://github.com/Jean-Tinland/simple-bar "${widgets_folder}/simple-bar"

  # Create a symbolic link
  ln -sfv "${dotfiles_dir}/config/ubersicht/.simplebarrc" "${HOME}/.simplebarrc"

  print_done
}

main
