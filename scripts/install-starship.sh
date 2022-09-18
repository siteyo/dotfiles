#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd "$(git rev-parse --show-toplevel)" || exit 1

echo '==> Install starship ...'

# Create directory
mkdir -pv ~/.config/

# Create symbolic link
ln -sfv ~/dotfiles/starship.toml ~/.config/starship.toml

echo ''
