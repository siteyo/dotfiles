#!/bin/bash

current_dir=$(dirname "${BASH_SOURCE[0]}")
dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

echo 'Install Homebrew ...'
command -v brew 1>/dev/null 2>&1 ||
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo ''

echo 'Install fomula using Homebrew ...'
if [ "$(uname)" == 'Darwin' ]; then
    ln -sfv "${dotfiles_dir}/Brewfile-Darwin" "${HOME}/.Brewfile"
elif [ "$(uname)" == 'Linux' ]; then
    ln -sfv "${dotfiles_dir}/Brewfile-Linux" "${HOME}/.Brewfile"
    sudo apt install build-essential procps curl file git
fi

eval "${SHELL}" -l

[ -f "${HOME}/.Brewfile" ] && brew bundle --global
echo ''
