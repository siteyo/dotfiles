#!/bin/bash

main() {
  set -euo pipefail
  echo '==> Install nvim ...'

  # Create directories
  mkdir -pv "${HOME}/.nvim"
  mkdir -pv "${HOME}/.nvim/backup"
  mkdir -pv "${HOME}/.nvim/swap"
  mkdir -pv "${HOME}/.nvim/undo"

  # Create a local setting file
  touch "${HOME}/.nvim/local_init.lua"

  # for Telescope frecency
  sudo apt install sqlite3 libsqlite3-dev

  # Install plugins
  nvim --headless -c 'Lazy sync' -c 'qall'

  echo ''
}

main
