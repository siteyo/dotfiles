#!/bin/bash

current_dir=$(dirname "${BASH_SOURCE[0]}")
dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

echo '==> Install nvim ...'

# Create directories
mkdir -pv "${HOME}/.config/nvim"
mkdir -pv "${HOME}/.nvim"
mkdir -pv "${HOME}/.nvim/backup"
mkdir -pv "${HOME}/.nvim/swap"
mkdir -pv "${HOME}/.nvim/undo"

# Create a local setting file
touch "${HOME}/.nvim/local_vimrc.vim"

# Create symbolic links
ln -sfv "${dotfiles_dir}/vim/vimrc" "${HOME}/.config/nvim/init.vim"
ln -sfv "${dotfiles_dir}/vim/coc-settings.json" "${HOME}/.config/nvim/coc-settings.json"

# Install plugins
nvim +PlugInstall +qall

echo ''
