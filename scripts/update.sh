#!/bin/bash

main() {
  set -euo pipefail
  source "$(git rev-parse --show-toplevel)/scripts/util.sh"

  local yes
  if [ $# -gt 0 ]; then
    yes=$1
  else
    yes=''
  fi

  if [ "${yes}" != '' ] && [ "${yes}" != '-y' ] && [ "${yes}" != '--yes' ]; then
    print_error "invalid arguments ${1}"
    exit 1
  fi

  print_notice 'Update authentication information.'
  sudo -v

  # apt
  if [ "$(uname)" == 'Linux' ]; then
    print_notice 'Update packages managed by apt.'
    sudo apt update && sudo apt upgrade "${yes}"
  fi

  # brew
  print_notice 'Update packages managed by homebrew.'
  brew update
  brew upgrade

  # other
  # bash "$(git rev-parse --show-toplevel)/scripts/installer.sh" --update
}

main "$@"
