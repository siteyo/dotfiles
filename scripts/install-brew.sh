#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd "$(git rev-parse --show-toplevel)" || exit 1

echo 'Install Homebrew ...'
command -v brew 1>/dev/null 2>&1 || 
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo ''

echo 'Install fomula using Homebrew ...'
if [ "$(uname)" == 'Darwin' ]; then
  ln -sfv ~/dotfiles/Brewfile-Darwin ~/.Brewfile
elif [ "$(uname)" == 'Linux' ]; then
  ln -sfv ~/dotfiles/Brewfile-Linux ~/.Brewfile
fi

[ -f ~/.Brewfile ] && brew bundle --global
echo ''
