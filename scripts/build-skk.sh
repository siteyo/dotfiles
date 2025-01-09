#!/bin/bash

azik2kanarule() {
  local dotfiles_dir=$1
  jq -r '. | to_entries[] | [.key, .value.hira] | join(",")' "${dotfiles_dir}/etc/azik_us.json" >"${dotfiles_dir}/etc/kana-rule.conf"
}

azik2skkeleton() {
  local dotfiles_dir=$1
  jq -r '. | with_entries(.value |= [.hira, ""])' "${dotfiles_dir}/etc/azik_us.json" |
    sed "s/\&comma;/,/g" >"${dotfiles_dir}/config/nvim/etc/azik_skkeleton.json"
}

main() {
  set -euo pipefail
  source "$(git rev-parse --show-toplevel)/scripts/util.sh"
  print_info '==> Build skk mapping files ...'

  # Change current directory
  current_dir=$(dirname "${BASH_SOURCE[0]}")
  dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

  # Check requirements
  if command -v jq >/dev/null; then
    azik2kanarule "${dotfiles_dir}"
    azik2skkeleton "${dotfiles_dir}"
  else
    print_error "jq is required for build."
    exit 1
  fi

  print_done
}

main
