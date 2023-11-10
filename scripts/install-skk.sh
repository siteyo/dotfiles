#!/bin/bash

main() {
  set -euo pipefail
  source "$(git rev-parse --show-toplevel)/scripts/util.sh"
  print_info '==> Install skk dict and setup azik ...'

  # Change current directory
  current_dir=$(dirname "${BASH_SOURCE[0]}")
  dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

  # Create directory
  mkdir -pv ~/.local/share/skk

  # Download and unzip
  curl https://skk-dev.github.io/dict/SKK-JISYO.L.gz |
    gunzip -c >"${HOME}/.local/share/skk/SKK-JISYO.L"
  curl https://skk-dev.github.io/dict/SKK-JISYO.jinmei.gz |
    gunzip -c >"${HOME}/.local/share/skk/SKK-JISYO.jinmei"

  # Setup azik
  ln -sfv "${dotfiles_dir}/etc/azik_us.rule" "${HOME}/.local/share/skk/azik_us.rule"

  # Setup corvusskk
  if uname -a | grep -q microsoft; then
    winhome="$(wslpath "$(wslvar USERPROFILE)")"
    mkdir -pv "${winhome}/AppData/Roaming/CorvusSKK"
    mv -v "${winhome}/AppData/Roaming/CorvusSKK/config.xml" "${winhome}/AppData/Roaming/CorvusSKK/config-bk.xml"
    cp -fv "${dotfiles_dir}/etc/corvusskk-config.xml" "${winhome}/AppData/Roaming/CorvusSKK/config.xml"
  fi

  if [ "$(uname)" == 'Darwin' ]; then
    ln -sfv "${dotfiles_dir}/etc/azik_us_aqua.rule" "${HOME}/Library/Application Support/AquaSKK/azik_us.rule"
    ln -sfv "${dotfiles_dir}/etc/kana-rule.conf" "${HOME}/Library/Application Support/AquaSKK/kana-rule.conf"
    ln -sfv "${dotfiles_dir}/etc/keymap.conf" "${HOME}/Library/Application Support/AquaSKK/keymap.conf"
  fi

  print_done
}

main
