#!/bin/bash

main() {
  set -euo pipefail
  echo 'Install Homebrew ...'

  local current_dir dotfiles_dir

  current_dir=$(dirname "${BASH_SOURCE[0]}")
  dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

  if [ "$(uname)" == 'Darwin' ]; then
    ln -sfv "${dotfiles_dir}/etc/Brewfile-Darwin" "${HOME}/.Brewfile"
  elif [ "$(uname)" == 'Linux' ]; then
    ln -sfv "${dotfiles_dir}/etc/Brewfile-Linux" "${HOME}/.Brewfile"
    sudo apt install build-essential procps curl file git
  fi

  command -v brew 1>/dev/null 2>&1 ||
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo ''

  eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"

  [ -f "${HOME}/.Brewfile" ] && brew bundle --global
}

main
