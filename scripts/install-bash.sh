#!/bin/bash

main() {
  set -euo pipefail
  echo '==> Install bash ...'

  local current_dir dotfiles_dir

  # Change current directory
  current_dir=$(dirname "${BASH_SOURCE[0]}")
  dotfiles_dir=$(builtin cd "${current_dir}" && git rev-parse --show-toplevel)

  # Create backup directory
  mkdir -pv "${dotfiles_dir}/bak"

  # Create local setting file
  touch "${HOME}/.bashrc.local"
  touch "${HOME}/.bash_profile.local"

  # git-prompt
  if [ ! -f "${HOME}/.git-prompt.sh" ]; then
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-prompt.sh \
      -o "${HOME}/.git-prompt.sh"
  fi

  # git-completion
  if [ ! -f "${HOME}/.git-completion.bash" ]; then
    curl https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash \
      -o "${HOME}/.git-completion.bash"
  fi

  # Move to backup directory
  [ -f "${HOME}/.bashrc" ] &&
    mv -v "${HOME}/.bashrc" "${dotfiles_dir}/bak/.bashrc"
  [ -f "${HOME}/.bash_profile" ] &&
    mv -v "${HOME}/.bash_profile" "${dotfiles_dir}/bak/.bash_profile"

  # Create a symbolic link
  ln -sfv "${dotfiles_dir}/etc/.bashrc" "${HOME}/.bashrc"
  ln -sfv "${dotfiles_dir}/etc/.bash_profile" "${HOME}/.bash_profile"

  echo ''
}

main
