#!/bin/bash

install_bundle() {
  print_info 'Install Homebrew bundle ...'

  local current_dir dotfiles_dir

  current_dir=$(dirname "${BASH_SOURCE[0]}")
  dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

  if [ "$(uname)" == 'Darwin' ]; then
    ln -sfv "${dotfiles_dir}/etc/Brewfile-Darwin" "${HOME}/.Brewfile"
  elif [ "$(uname)" == 'Linux' ]; then
    ln -sfv "${dotfiles_dir}/etc/Brewfile-Linux" "${HOME}/.Brewfile"
    sudo apt install build-essential procps curl file git
  fi

  [ -f "${HOME}/.Brewfile" ] && brew bundle --global || true

  print_success "Installation is complete."
}

install_brew() {
  print_info 'Install Homebrew ...'

  command -v brew 1>/dev/null 2>&1 ||
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  # if [ "$(uname)" == 'Linux' ]; then
  #   eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"
  # elif [ "$(uname)" == 'Darwin' ]; then
  #   if [ -f '/opt/homebrew/bin/brew' ]; then
  #     eval "$(/opt/homebrew/bin/brew shellenv)"
  #   elif [ -f '/usr/local/bin/brew' ]; then
  #     eval "$(/usr/local/bin/brew shellenv)"
  #   fi
  # fi

  print_success "Installation is complete."
}

main() {
  set -euo pipefail
  source "$(git rev-parse --show-toplevel)/scripts/util.sh"

  while [ $# -gt 0 ]; do
    case ${1} in
    --bundle) install_bundle ;;
    --brew) install_brew ;;
    *)
      ;;
    esac
    shift
  done

  print_done
}

main "$@"
