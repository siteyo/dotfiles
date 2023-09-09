#!/bin/bash

set -euo pipefail

#------------------------------------------------------------#
## Remove Functions                                         ##
#------------------------------------------------------------#
remove_neovim() {
  print_info '==> Remove neovim settings ...'

  # Remove directory
  [ -e "${HOME}/.nvim" ] &&
    rm -rfv "${HOME}/.nvim"
  [ -e "${HOME}/.local/share/nvim" ] &&
    rm -rfv "${HOME}/.local/share/nvim"
  [ -e "${HOME}/.cache/nvim" ] &&
    rm -rfv "${HOME}/.cache/nvim"

  print_done
}

remove_wezterm() {
  print_info '==> Remove wezterm settings ...'

  local winhome
  if uname -a | grep -q 'microsoft'; then
    winhome="$(wslpath "$(wslvar USERPROFILE)")"
    rm -v "${winhome}/.config/wezterm/wezterm.lua"
  fi

  print_done
}

remove_zsh() {
  print_info '==> Remove zsh settings ...'

  [ -e "${HOME}/.zcompcache" ] &&
    rm -rfv "${HOME}/.zcompcache"
  [ -e "${HOME}/.zcompdump" ] &&
    rm -v "${HOME}/.zcompdump"
  [ -e "${HOME}/.zsh_history" ] &&
    rm -v "${HOME}/.zsh_history"
  [ -e "${HOME}/.zshrc.local" ] &&
    rm -v "${HOME}/.zshrc.local"

  print_done
}

remove_gitconfig() {
  print_info '==> Remove git settings ...'

  [ -e "${HOME}/.git-completion.bash" ] &&
    rm -v "${HOME}/.git-completion.bash"
  [ -e "${HOME}/.git-credentials" ] &&
    rm -v "${HOME}/.git-credentials"
  [ -e "${HOME}/.git-prompt.sh" ] &&
    rm -v "${HOME}/.git-prompt.sh"
  [ -e "${HOME}/.gitconfig" ] &&
    rm -v "${HOME}/.gitconfig"

  print_done
}

#------------------------------------------------------------#
## Main                                                     ##
#------------------------------------------------------------#
main() {
  set -euo pipefail
  source "$(git rev-parse --show-toplevel)/scripts/util.sh"

  print_info '==> Clean data(~/.local, ~/.cache, etc...)'

  remove_neovim
  remove_wezterm
  remove_zsh
  remove_gitconfig

  print_done
}

main
