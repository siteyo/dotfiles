#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd "$(git rev-parse --show-toplevel)" || exit 1

echo '==> Install alacritty ...'

# Create directory
mkdir -pv ~/.config/alacritty

# Create symbolic link
ln -sfv ~/dotfiles/config/alacritty/alacritty.yml ~/.config/alacritty/alacritty.yml

echo ''
