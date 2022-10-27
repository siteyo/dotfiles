#!/bin/bash

current_dir=$(dirname "${BASH_SOURCE[0]}")
dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

echo '==> Install nvim ...'

# Create directories
mkdir -pv "${dotfiles_dir}/bak"
mkdir -pv "${HOME}/.config/nvim"
mkdir -pv "${HOME}/.nvim"
mkdir -pv "${HOME}/.nvim/backup"
mkdir -pv "${HOME}/.nvim/swap"
mkdir -pv "${HOME}/.nvim/undo"

# Create a local setting file
touch "${HOME}/.nvim/local_init.lua"

# Backup
[ -d "${HOME}/.config/nvim" ] \
    && mv -v "${HOME}/.config/nvim" "${dotfiles_dir}/bak"

# Create symbolic links
ln -sfv "${dotfiles_dir}/config/nvim" "${HOME}/.config/nvim"

echo ''
