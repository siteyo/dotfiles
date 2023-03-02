#!/bin/bash

main() {
  set -euo pipefail
  echo '==> Uninstall ...'

  # Remove symlink
  find "${HOME}" -maxdepth 1 -type l -delete

  echo ''
}

main
