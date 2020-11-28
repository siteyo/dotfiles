#!/bin/bash
for extension in `cat ~/dotfiles/vscode/extensions`; do
    code --install-extension $extension
done