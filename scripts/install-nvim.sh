#!/bin/bash

# Create directories
mkdir -pv ~/.config/nvim
mkdir -pv ~/.nvim
mkdir -pv ~/.nvim/backup
mkdir -pv ~/.nvim/swap
mkdir -pv ~/.nvim/undo

# Create a local setting file
touch ~/.nvim/local_vimrc.vim

# Create symbolic links
ln -sfv ~/dotfiles/vim/vimrc ~/.config/nvim/init.vim
ln -sfv ~/dotfiles/vim/gvimrc ~/.config/nvim/ginit.vim
ln -sfv ~/dotfiles/vim/coc-settings.json ~/.config/nvim/coc-settings.json

# Install plugins
nvim +PlugInstall +qall
