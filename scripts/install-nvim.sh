#!/bin/bash

main() {
  set -euo pipefail
  source "$(git rev-parse --show-toplevel)/scripts/util.sh"
  print_info '==> Install nvim ...'

  # Create directories
  mkdir -pv "${HOME}/.nvim"
  mkdir -pv "${HOME}/.nvim/backup"
  mkdir -pv "${HOME}/.nvim/swap"
  mkdir -pv "${HOME}/.nvim/undo"

  # Create a local setting file
  # touch "${HOME}/.nvim/local_init.lua"

  # for Telescope frecency
  if uname -a | grep -q -e 'microsoft' -e 'Ubuntu'; then
    sudo apt-get install sqlite3 libsqlite3-dev
  fi

  print_done
}

main
