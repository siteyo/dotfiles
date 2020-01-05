#!/bin/bash

# Create directories
mkdir -p ~/.config/vim
mkdir -p ~/.vim
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/undo

# Create a local setting file
touch ~/.vim/local_vimrc.vim

# Create symbolic links
ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim/gvimrc ~/.gvimrc
ln -sf ~/dotfiles/vim/coc-settings.json ~/.config/vim/coc-settings.json

# Install plugins
vim +PlugInstall +qall
