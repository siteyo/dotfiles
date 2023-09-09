#!/bin/bash

main() {
  set -euo pipefail
  source "$(git rev-parse --show-toplevel)/scripts/util.sh"
  print_info '==> Uninstall ...'

  # Remove symlink
  find "${HOME}" -maxdepth 1 -type l -delete

  print_done
}

main
