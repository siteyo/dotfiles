#!/bin/bash

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
ln -sfv ~/dotfiles/vim/gvimrc ~/.gvimrc
ln -sfv ~/dotfiles/vim/coc-settings.json ~/.config/vim/coc-settings.json

# Install plugins
vim +PlugInstall +qall
