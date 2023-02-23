#!/bin/bash

set -euo pipefail

main() {
    echo 'Install Homebrew formula ...'
    [ -f "${HOME}/.Brewfile" ] && brew bundle --global
    echo ''
}

main
