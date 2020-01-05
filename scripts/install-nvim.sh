#!/bin/bash

# Create directories
mkdir -p ~/.config/nvim
mkdir -p ~/.nvim
mkdir -p ~/.nvim/backup
mkdir -p ~/.nvim/swap
mkdir -p ~/.nvim/undo

# Create a local setting file
touch ~/.nvim/local_vimrc.vim

# Create symbolic links
ln -sf ~/dotfiles/vim/vimrc ~/.config/nvim/init.vim
ln -sf ~/dotfiles/vim/gvimrc ~/.config/nvim/ginit.vim
ln -sf ~/dotfiles/vim/coc-settings.json ~/.config/nvim/coc-settings.json

# Install plugins
nvim +PlugInstall +qall
