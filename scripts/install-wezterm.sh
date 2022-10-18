#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd "$(git rev-parse --show-toplevel)" || exit 1

echo '==> Install wezterm ...'

if uname -a | grep -q microsoft
then
    WINHOME="$(wslpath "$(wslvar USERPROFILE)")"
    mkdir -pv "${WINHOME}/.config/wezterm"
    cp -fv ~/dotfiles/config/wezterm/wezterm.lua "${WINHOME}/.config/wezterm/wezterm.lua"
elif [ "$(uname)" == 'Darwin' ]
then
    mkdir -pv ~/.config/wezterm
    ln -sfv ~/dotfiles/config/wezterm/wezterm.lua ~/.config/wezterm/wezterm.lua
fi

echo ''
