#!/bin/sh

# Rename/Create
if [ -f ~/.bashrc ]; then
    mv ~/.bashrc ~/.bashrc.local
else
    touch ~/.bashrc
    touch ~/.bashrc.local
fi

if [ -f ~/.bash_profile ]; then
    mv ~/.bash_profile ~/.bash_profile.local
fi

# Create a symbolic link
ln -sf ~/dotfiles/bashrc ~/.bashrc
ln -sf ~/dotfiles/bash_profile ~/.bash_profile
