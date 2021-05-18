#!/bin/bash

echo "
This script will install hte following
  * Homebrew and the software that can be installed using it.
  * rc files (bash/vim/neovim)
  * git config files
  * and so on...

If you're using Linux, check out the following sites.
  https://docs.brew.sh/Homebrew-on-Linux

"
read -p "Ready? (y/N): " yn
case "$yn" in
  [yY]*) ;;
  *) echo "abort."; exit ;;
esac

if [ "$(uname -s)" = 'Linux' || "$(uname -s)" = 'Darwin' ]; then
  # Homebrew
  [ -z "$(which brew)" ] &&
    /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo "Updateting Homebrew"
  brew install ripgrep bat neovim anyenv tree tmux
  brew tap universal-ctags/universal-ctags
  brew install universal-ctags
fi

./install-bash.sh
./install-vim.sh
./install-nvim.sh
./install-gitconfig.sh
