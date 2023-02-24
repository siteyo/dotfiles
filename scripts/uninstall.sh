#!/bin/bash

set -euo pipefail

main() {
    echo '==> Uninstall ...'

    # Remove symlink
    find "${HOME}" -maxdepth 1 -type l -delete

    echo ''
}

main
