#!/bin/bash

echo '==> Uninstall ...'

# Remove symlink
find ~ -type l -maxdepth 1 -delete
