# siteyo's dotfiles

[![Install Test (Ubuntu)](https://github.com/siteyo/dotfiles/actions/workflows/install-test-ubuntu.yml/badge.svg)](https://github.com/siteyo/dotfiles/actions/workflows/install-test-ubuntu.yml)
[![Install Test (Darwin)](https://github.com/siteyo/dotfiles/actions/workflows/install-test-darwin.yml/badge.svg)](https://github.com/siteyo/dotfiles/actions/workflows/install-test-darwin.yml)
[![Audit Dependency](https://github.com/siteyo/dotfiles/actions/workflows/audit-dependency.yml/badge.svg?branch=main)](https://github.com/siteyo/dotfiles/actions/workflows/audit-dependency.yml)
[![Endpoint Badge](https://img.shields.io/endpoint?url=https%3A%2F%2Fgist.githubusercontent.com%2Fsiteyo%2F093763e63c107ab23ebef0133c42e039%2Fraw%2Fvim-startuptime.json&style=flat)](https://github.com/siteyo/dotfiles/actions/workflows/nvim-startuptime.yml?query=branch%3Amain)

![macos-tiling](assets/macos/tiling.png)


## Contents

The maintained contents are listed below.

* Terminal
  * [Wezterm](https://wezfurlong.org/wezterm/index.html)
  * [kitty](https://sw.kovidgoyal.net/kitty/)
* Editor
  * [Neovim](https://neovim.io/)
  * [LazyVim](https://www.lazyvim.org/)
* Package Manager
  * [Homebrew](https://brew.sh/)
  * [npm](https://www.npmjs.com/) (for neovim)
  * [rye](https://github.com/astral-sh/rye) (for neovim)
  * [aqua](https://aquaproj.github.io/)
* Shell
  * bash
  * zsh
  * [Sheldon](https://github.com/rossmacarthur/sheldon)
  * [Powerlevel10k](https://github.com/romkatv/powerlevel10k)
* Window Manager
  * [AeroSpace](https://github.com/nikitabobko/AeroSpace)
* Others
  * [Git](https://www.git-scm.com/)
  * [Sketchybar](https://felixkratz.github.io/SketchyBar/)
  * [Raycast](https://www.raycast.com/) (only script command)
  * [aquaskk](https://github.com/codefirst/aquaskk)


## Font

* [FiraCode](https://github.com/tonsky/FiraCode)
  * for macOS: Install using Homebrew. (Included in Brewfile-Darwin.)
  * for WSL: Install manually.
* [HackGen](https://github.com/yuru7/HackGen/releases)
  * for macOS: Install using Homebrew. (Included in Brewfile-Darwin.)
  * for WSL: Install manually.
* [0xProto](https://github.com/0xType/0xProto)
  * for macOS: Install using Homebrew. (Included in Brewfile-Darwin.)
  * for WSL: Install manually.

## How to Setup

The following command will install all of the contents.
However, in the case of macOS, it may be necessary to install Homebrew first.

```bash
make install
```

For more information, please check the following.

```bash
make help
```

## Requirements

Check out the following sites

* [for macOS](https://docs.brew.sh/Installation#macos-requirements)
* [for Linux](https://docs.brew.sh/Homebrew-on-Linux#requirements)

## HHKB Settings

See [here](./etc/hhkb/README.md) for HHKB mapping settings.

