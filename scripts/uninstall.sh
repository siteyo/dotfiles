#!/bin/bash

echo '==> Uninstall ...'

# Remove symlink
find ~ -maxdepth 1 -type l -delete

find ~/.config -maxdepth 2 -type l -delete
