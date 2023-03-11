#!/bin/bash

# Load .bashrc
if [ -f ~/.bashrc ]; then
  source "${HOME}/.bashrc"
fi

if [ -f ~/.bash_profile.local ]; then
  source "${HOME}/.bash_profile.local"
fi
