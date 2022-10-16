#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd "$(git rev-parse --show-toplevel)" || exit 1

echo '==> Install sheldon plugins ...'

mkdir -pv bak
mkdir -pv ~/.config/sheldon

[ -f ~/.config/sheldon/plugins.toml ] \
  && mv -v ~/.config/sheldon/plugins.toml bak

ln -sfv ~/dotfiles/config/sheldon/plugins.toml ~/.config/sheldon/plugins.toml

echo ''
