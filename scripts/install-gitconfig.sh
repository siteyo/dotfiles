#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd "$(git rev-parse --show-toplevel)" || exit 1

[ ! -e ~/.gitconfig ] && touch ~/.gitconfig
git config --global include.path ~/dotfiles/gitconfig

# Create a symbolic link to ~/.gitconfig
# ln -sfv ~/dotfiles/gitconfig ~/.gitconfig

echo "
Do you want to add username and email address to the .gitconfig?
"
read -p "(y/N): " yn
case "$yn" in
  [yY]*) ;;
  *) echo "abort."; exit ;;
esac

git config --global user.email "phicyanoc@gmail.com"
git config --global user.name "Saito Yuki"
