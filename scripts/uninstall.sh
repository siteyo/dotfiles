#!/bin/bash

set -euo pipfail

main() {
    echo '==> Uninstall ...'

    # Remove symlink
    find "${HOME}" -maxdepth 1 -type l -delete

    echo ''
}

main
