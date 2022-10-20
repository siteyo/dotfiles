#!/bin/bash

current_dir=$(dirname "${BASH_SOURCE[0]}")
dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

echo '==> Install tmux ...'

# Create backup directory
mkdir -pv "${dotfiles_dir}/bak"

# Move to backup directory
[ -f "${HOME}/.tmux.conf" ] \
    && mv -v "${HOME}/.tmux.conf" "${dotfiles_dir}/bak/.tmux.conf"

# Create a symbolic link
ln -sfv "${dotfiles_dir}/etc/.tmux.conf" "${HOME}/.tmux.conf"

echo ''
