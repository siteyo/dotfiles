#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd "$(git rev-parse --show-toplevel)" || exit 1

echo '==> Install wezterm ...'

# Create directory
mkdir -pv ~/.config/wezterm

# Create symbolic link
ln -sfv ~/dotfiles/config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua

echo ''
