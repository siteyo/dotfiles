#!/bin/bash

install_poetry() {
  echo '==> Install poetry ...'
  if comnmand -v poetry; then
    echo 'Already installed.'
  else
    curl -sSL https://install.python-poetry.org | python3 -
  fi
}

install_rust() {
  echo '==> Install rust ...'
  if command -v rustc; then
    echo 'Already installed.'
  else
    curl --proto '=https' --tlsv1.2 -sSf https://sh.rustup.rs | sh
  fi
}

install_asdf_plugins() {
  echop '==> Install asdf plugins ...'
  if ! command -v asdf; then
    echo 'asdf is not installed.'
  fi

  local asdf_list
  asdf_list=$(asdf list)

  if grep -q 'nodejs' <"${asdf_list}"; then
    echo 'Node.js: Already installed.'
  else
    asdf plugin add nodejs https://github.com/asdf-vm/asdf-nodejs.git
  fi

  if grep -q 'python' <"${asdf_list}"; then
    echo 'Python: Already installed.'
  else
    asdf plugin-add python
  fi
}

main() {
  while [ $# -gt 0 ]; do
    case ${1} in
    --poetry) install_poetry ;;
    --rust) install_rust ;;
    --asdf) install_asdf_plugins ;;
    *)
      echo "Invalid arguments ${1}"
      exit 1
      ;;
    esac
    shift
  done
}

main "$@"
