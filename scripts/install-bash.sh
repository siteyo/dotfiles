#!/bin/bash

cd "$(dirname "${BASH_SOURCE[0]}")" || exit 1
cd "$(git rev-parse --show-toplevel)" || exit 1

echo '==> Install bash ...'

mkdir -pv bak
touch ~/.bashrc.local
touch ~/.bash_profile.local

# git-prompt
if [ ! -e ~/.git-prompt.sh ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh -o ~/.git-prompt.sh
fi

# git-completion
if [ ! -e ~/.git-completion.bash ]; then
  curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash -o ~/.git-completion.bash
fi

# Move
[ -e ~/.bashrc ] && mv -v ~/.bashrc bak/.bashrc
[ -e ~/.bash_profile ] && mv -v ~/.bash_profile bak/.bash_profile

# Create a symbolic link
ln -sfv ~/dotfiles/bashrc ~/.bashrc
ln -sfv ~/dotfiles/bash_profile ~/.bash_profile

echo ''
