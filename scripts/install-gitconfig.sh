#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd "$(git rev-parse --show-toplevel)" || exit 1

mkdir -pv bak
touch ~/.gitconfig.local

# Rename or create .gitconfig and gitconfig.local
[ -e ~/.gitconfig ] && mv -v ~/.gitconfig bak/.gitconfig

# Create a symbolic link to ~/.gitconfig
ln -sfv ~/dotfiles/gitconfig ~/.gitconfig
