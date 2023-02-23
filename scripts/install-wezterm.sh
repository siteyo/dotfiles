#!/bin/bash

main() {
    echo '==> Install wezterm ...'

    local current_dir dotfiles_dir winhome

    # Change current directory
    current_dir=$(dirname "${BASH_SOURCE[0]}")
    dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

    if uname -a | grep -q microsoft; then
        winhome="$(wslpath "$(wslvar USERPROFILE)")"
        mkdir -pv "${winhome}/.config/wezterm"
        cp -fv "${dotfiles_dir}/config/wezterm/wezterm.lua" "${winhome}/.config/wezterm/wezterm.lua"
    fi

    echo ''
}

main
