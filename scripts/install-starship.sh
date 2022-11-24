#!/bin/bash

current_dir=$(dirname "${BASH_SOURCE[0]}")
dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

echo '==> Install starship ...'

# Create directories
mkdir -pv "${dotfiles_dir}/bak"
mkdir -pv "${HOME}/.config"

# Move to backup directory
[ -f "${HOME}/.config/starship.toml" ] &&
    mv -v "${HOME}/.config/starship.toml" "${dotfiles_dir}/bak"

# Create symbolic link
ln -sfv "${dotfiles_dir}/config/starship.toml" "${HOME}/.config/starship.toml"

echo ''
