#!/bin/sh

# Load .bashrc
if [ -f ~/.bashrc ]; then
  source ~/.bashrc
fi

if [ -f ~/.bash_profile.local ]; then
  source ~/.bash_profile.local
fi
