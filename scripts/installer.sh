#!/bin/bash

install_rust() {
  print_info '==> Install rust ...'
  if command -v rustc >/dev/null; then
    print_notice 'Already installed.'
  else
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  fi
  print_done
}

install_volta() {
  print_info '==> Install volta ...'
  if command -v volta >/dev/null; then
    print_notice 'Already installed.'
  else
    curl https://get.volta.sh | bash -s -- --skip-setup
    ${HOME}/.volta/bin/volta completions zsh >"${COMPLETIONS_PATH}/_volta"
  fi
  print_done
}

install_rye() {
  print_info '==> Install rye'
  if command -v rye >/dev/null; then
    print_notice 'Already installed.'
  else
    curl -sSf https://rye-up.com/get | RYE_INSTALL_OPTION="--yes" bash
  fi
  print_done
}

main() {
  set -euo pipefail
  source "$(git rev-parse --show-toplevel)/scripts/util.sh"

  while [ $# -gt 0 ]; do
    case ${1} in
    --rust) install_rust ;;
    --asdf) install_asdf_plugins ;;
    --volta) install_volta ;;
    --rye) install_rye ;;
    *)
      print_error "Invalid arguments ${1}"
      exit 1
      ;;
    esac
    shift
  done

  print_success "All installation is complete."
}

main "$@"
