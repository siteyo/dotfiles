#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd "$(git rev-parse --show-toplevel)" || exit 1

echo '==> Install vim ...'

# Create directories
mkdir -pv ~/.config/vim
mkdir -pv ~/.vim
mkdir -pv ~/.vim/backup
mkdir -pv ~/.vim/swap
mkdir -pv ~/.vim/undo

# Create a local setting file
touch ~/.vim/local_vimrc.vim

# Create symbolic links
ln -sfv ~/dotfiles/vim/vimrc ~/.vimrc
# ln -sfv ~/dotfiles/vim/gvimrc ~/.gvimrc
ln -sfv ~/dotfiles/vim/coc-settings.json ~/.config/vim/coc-settings.json

# Install plugins
vim +PlugInstall +qall

echo ''
