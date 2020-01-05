#!/bin/sh
if [ -f ~/.gitconfig ]; then
    mv ~/.gitconfig ~/.gitconfig.local
else
    touch ~/.gitconfig
    touch ~/.gitconfig.local
fi
ln -sf ~/dotfiles/gitconfig ~/.gitconfig
