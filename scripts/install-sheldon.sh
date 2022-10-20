#!/bin/bash

current_dir=$(dirname "${BASH_SOURCE[0]}")
dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

echo '==> Install sheldon plugins ...'

# Create directories
mkdir -pv "${dotfiles_dir}/bak"
mkdir -pv "${HOME}/.config/sheldon"

# Move to backup directory
[ -f "${HOME}/.config/sheldon/plugins.toml" ] \
  && mv -v "${HOME}/.config/sheldon/plugins.toml" "${dotfiles_dir}/bak"

# Create symbolic link
ln -sfv "${dotfiles_dir}/config/sheldon/plugins.toml" "${HOME}/.config/sheldon/plugins.toml"

echo ''
