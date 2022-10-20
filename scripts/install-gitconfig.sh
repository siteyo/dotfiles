#!/bin/bash

current_dir=$(dirname "${BASH_SOURCE[0]}")
dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

echo '==> Install git ...'

[ ! -f "$HOME/.gitconfig" ] && touch "$HOME/.gitconfig"
git config --global include.path "${dotfiles_dir}/etc/.gitconfig"

echo "Do you want to add username and email address to the .gitconfig?"
read -rp "(y/N): " yn
case "$yn" in
  [yY]*) ;;
  *) echo "abort."; exit ;;
esac

git config --global user.email "phicyanoc@gmail.com"
git config --global user.name "Saito Yuki"

echo ''
