#!/bin/bash

main() {
  set -euo pipefail
  echo '==> Install skk dict ...'

  # Create directory
  mkdir -pv ~/.local/share/skk

  # Download and unzip
  curl https://skk-dev.github.io/dict/SKK-JISYO.L.gz |
    gunzip -c >"${HOME}/.local/share/skk/SKK-JISYO.L"
  curl https://skk-dev.github.io/dict/SKK-JISYO.jinmei.gz |
    gunzip -c >"${HOME}/.local/share/skk/SKK-JISYO.jinmei"

  echo ''
}

main
