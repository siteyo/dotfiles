#!/bin/bash

current_dir=$(dirname "${BASH_SOURCE[0]}")
dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

echo '==> Install zsh ...'

# Create directory
mkdir -pv "${dotfiles_dir}/bak"

# Create local config file
touch "${HOME}/.zshrc.local"

# Backup
[ -f "${HOME}/.zshenv" ] &&
    mv -v "${HOME}/.zshenv" "${dotfiles_dir}/bak"
[ -f "${HOME}/.zshrc" ] &&
    mv -v "${HOME}/.zshrc" "${dotfiles_dir}/bak"
[ -d "${HOME}/.config/zsh" ] &&
    mv -v "${HOME}/.config/zsh" "${dotfiles_dir}/bak"

# Create symlinks
ln -sfv "${dotfiles_dir}/.zshenv" "${HOME}/.zshenv"
ln -sfv "${dotfiles_dir}/config/zsh" "${HOME}/.config/zsh"

echo ''
