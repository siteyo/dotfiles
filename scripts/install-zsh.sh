#!/bin/bash

current_dir=$(dirname "${BASH_SOURCE[0]}")
dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

echo '==> Install zsh ...'

mkdir -pv "${dotfiles_dir}/bak"
touch "${HOME}/.zshrc.local"

[ -f "${HOME}/.zshrc" ] \
    && mv -v "${HOME}/.zshrc" "${dotfiles_dir}/bak/.zshrc"
# [ -e "${HOME}/.p10k.zsh" ] \
#    && mv -v "%{HOME}/.p10k.zsh" "${dotfiles_dir}/bak/.p10k.zsh"

ln -sfv "${dotfiles_dir}/zshrc" "${HOME}/.zshrc"
# ln -sfv "${dotfiles_dir}/etc/.p10k.zsh" "${HOME}/.p10k.zsh"

echo ''
