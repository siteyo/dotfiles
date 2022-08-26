#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd "$(git rev-parse --show-toplevel)" || exit 1

echo 'Install Homebrew ...'
command -v brew 1>/dev/null 2>&1 || 
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo ''

echo 'Install fomula using Homebrew ...'
ln -sfv ~/dotfiles/Brewfile ~/.Brewfile
brew bundle --global
echo ''
