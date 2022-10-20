#!/bin/bash

echo '==> Uninstall ...'

# Remove symlink
find "${HOME}" -maxdepth 1 -type l -delete

find "${HOME}/.config" -maxdepth 2 -type l -delete
