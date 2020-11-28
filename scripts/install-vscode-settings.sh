#!/bin/bash

SETTING_DIR=~/Library/Application\ Support/Code/User

# Create bakcup
if [ -f "${SETTING_DIR}/keybindings.json" ]; then
    mv "${SETTING_DIR}/keybindings.json" "${SETTING_DIR}/keybindings.json.bak"
fi
if [ -f "${SETTING_DIR}/settings.json" ]; then
    mv "${SETTING_DIR}/settings.json" "${SETTING_DIR}/settings.json.bak"
fi

# Create a symbolic link
ln -sf ~/dotfiles/vscode/keybindings.json "${SETTING_DIR}/keybindings.json"
ln -sf ~/dotfiles/vscode/settings.json "${SETTING_DIR}/settings.json"
