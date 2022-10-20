#!/bin/bash

current_dir=$(dirname "${BASH_SOURCE[0]}")
dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

echo '==> Install vim ...'

# Create directories
mkdir -pv "${HOME}/.config/vim"
mkdir -pv "${HOME}/.vim"
mkdir -pv "${HOME}/.vim/backup"
mkdir -pv "${HOME}/.vim/swap"
mkdir -pv "${HOME}/.vim/undo"

# Create a local setting file
touch "${HOME}/.vim/local_vimrc.vim"

# Create symbolic links
ln -sfv "${dotfiles_dir}/vim/vimrc" "${HOME}/.vimrc"
ln -sfv "${dotfiles_dir}/vim/coc-settings.json" "${HOME}/.config/vim/coc-settings.json"

# Install plugins
vim +PlugInstall +qall

echo ''
