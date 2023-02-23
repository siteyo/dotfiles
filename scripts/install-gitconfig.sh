#!/bin/bash

set -euo pipefail

main() {
    echo '==> Install git ...'

    local current_dir dotfiles_dir yn

    # Change current directory
    current_dir=$(dirname "${BASH_SOURCE[0]}")
    dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

    # Create directory
    mkdir -pv "${dotfiles_dir}/bak"

    # Move to backup directory or Create config file
    if [ -f "${HOME}/.gitconfig" ]; then
        mv -v "${HOME}/.gitconfig" "${dotfiles_dir}/bak"
    else
        touch "${HOME}/.gitconfig"
    fi

    git config --global include.path "${dotfiles_dir}/etc/.gitconfig"
    git config --global credential.helper store

    echo "Do you want to add username and email address to the .gitconfig?"
    read -rp "(y/N): " yn
    case "$yn" in
    [yY]*) ;;
    *)
        echo "abort."
        exit
        ;;
    esac

    git config --global user.email "phicyanoc@gmail.com"
    git config --global user.name "Saito Yuki"

    echo ''
}

main
