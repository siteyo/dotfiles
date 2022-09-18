#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd "$(git rev-parse --show-toplevel)" || exit 1

echo '==> Install sheldon plugins ...'

mkdir -pv bak
mkdir -pv ~/.sheldon

[ -e ~/.sheldon/plugins.toml ] \
  && mv -v ~/.sheldon/plugins.toml bak

ln -sfv ~/dotfiles/sheldon/plugins.toml ~/.sheldon/plugins.toml

echo ''
