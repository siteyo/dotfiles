#!/bin/bash

# Rename or create .gitconfig and gitconfig.local
if [ -f ~/.gitconfig ]; then
    mv ~/.gitconfig ~/.gitconfig.local
else
    touch ~/.gitconfig.local
fi

# Create a symbolic link to ~/.gitconfig
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
