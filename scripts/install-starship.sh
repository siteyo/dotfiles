#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd "$(git rev-parse --show-toplevel)" || exit 1

echo '==> Install starship ...'

# Create directory
mkdir -pv bak
mkdir -pv ~/.config

[ -f ~/.config/starship.toml ] \
    && mv -v ~/.config/starship.toml bak

# Create symbolic link
ln -sfv ~/dotfiles/config/starship.toml ~/.config/starship.toml

echo ''
