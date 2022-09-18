#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd "$(git rev-parse --show-toplevel)" || exit 1

echo '==> Install tmux ...'

# Create a symbolic link
ln -sfv ~/dotfiles/tmux.conf ~/.tmux.conf

echo ''
