#!/bin/sh
mkdir -p ~/.config/vim
mkdir -p ~/.vim
mkdir -p ~/.vim/backup
mkdir -p ~/.vim/swap
mkdir -p ~/.vim/undo

touch ~/.vim/local_vimrc.vim

ln -sf ~/dotfiles/vim/vimrc ~/.vimrc
ln -sf ~/dotfiles/vim/gvimrc ~/.gvimrc
ln -sf ~/dotfiles/vim/coc-settings.json ~/.config/vim/coc-settings.json
