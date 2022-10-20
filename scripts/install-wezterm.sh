#!/bin/bash

current_dir=$(dirname "${BASH_SOURCE[0]}")
dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

echo '==> Install wezterm ...'

if uname -a | grep -q microsoft
then
    WINHOME="$(wslpath "$(wslvar USERPROFILE)")"
    mkdir -pv "${WINHOME}/.config/wezterm"
    cp -fv "${dotfiles_dir}/config/wezterm/wezterm.lua" "${WINHOME}/.config/wezterm/wezterm.lua"
elif [ "$(uname)" == 'Darwin' ]
then
    mkdir -pv "${HOME}/.config/wezterm"
    ln -sfv "${dotfiles_dir}/config/wezterm/wezterm.lua" "${HOME}/.config/wezterm/wezterm.lua"
fi

echo ''
