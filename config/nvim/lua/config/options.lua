------------------------------------------------------------
--- options.lua
------------------------------------------------------------
-- Global
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.editorconfig = true

-- Options
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.laststatus = 3
vim.o.showcmd = true
vim.o.cursorline = true
vim.o.tabstop = 2
vim.o.shiftwidth = 0
vim.o.backup = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.autochdir = false
vim.o.clipboard = "unnamed"
vim.o.encoding = "utf-8"
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.hidden = true
vim.o.autoread = true
vim.o.wildmenu = true
vim.o.wildignorecase = true
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.conceallevel = 0
vim.o.wrap = false
vim.o.inccommand = "split"
-- vim.o.fileformats = {'unix', 'dos', 'mac'}
-- vim.o.fileencodings=utf-8,sjis
vim.o.foldenable = true
vim.o.foldlevelstart = 99
vim.o.swapfile = false
vim.o.termguicolors = true
vim.o.virtualedit = "block"
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.updatetime = 300
vim.o.cmdheight = 2
-- vim.o.shortmess+=c
vim.o.showtabline = 2
vim.o.scrolloff = 4
vim.o.signcolumn = "yes"
vim.o.mouse = "a"
vim.o.undofile = true
vim.o.grepprg = "rg --vimgrep"

vim.o.winblend = 15
vim.o.pumblend = 15

vim.o.backupdir = vim.fn.expand("~/.nvim/backup")
vim.o.directory = vim.fn.expand("~/.nvim/swap")
vim.o.undodir = vim.fn.expand("~/.nvim/undo")

vim.o.background = require("config.util").appearance()

-- vim.o.spell = true
vim.o.spelllang = "en_us,cjk"
