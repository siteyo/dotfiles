------------------------------------------------------------
-- Global Variables
------------------------------------------------------------
vim.g.mapleader = " "
vim.g.maplocalleader = ","
vim.g.editorconfig = true
vim.g.loaded_node_provider = 0
vim.g.loaded_perl_provider = 0
vim.g.loaded_python3_provider = 0
vim.g.loaded_ruby_provider = 0

------------------------------------------------------------
-- User Interface
------------------------------------------------------------
vim.o.laststatus = 3
vim.o.showcmd = true
vim.o.cursorline = true
vim.o.number = true
vim.o.relativenumber = true
vim.o.showtabline = 2
vim.o.cmdheight = 2
vim.o.scrolloff = 4
vim.o.sidescrolloff = 5
vim.o.signcolumn = "yes"
vim.o.termguicolors = true
vim.o.conceallevel = 0
vim.o.wrap = false
vim.o.splitbelow = true
vim.o.splitright = true
vim.o.winblend = 15
vim.o.pumblend = 15
vim.o.background = require("config.util").appearance()

------------------------------------------------------------
-- Editing Behavior
------------------------------------------------------------
vim.o.autoindent = true
vim.o.smartindent = true
vim.o.tabstop = 2
vim.o.shiftwidth = 0
vim.o.expandtab = true
vim.o.smarttab = true
vim.o.virtualedit = "block"
vim.o.mouse = "a"
vim.o.inccommand = "split"

------------------------------------------------------------
-- Search & Completion
------------------------------------------------------------
vim.o.ignorecase = true
vim.o.smartcase = true
vim.o.hlsearch = true
vim.o.incsearch = true
vim.o.wildmenu = true
vim.o.wildignorecase = true

------------------------------------------------------------
-- File, Buffer, and Backup Management
------------------------------------------------------------
vim.o.hidden = true
vim.o.autoread = true
vim.o.autochdir = false
vim.o.encoding = "utf-8"
vim.o.backup = true
vim.o.swapfile = false
vim.o.undofile = true

vim.o.backupdir = vim.fn.expand("$XDG_DATA_HOME/nvim/backup")
vim.o.directory = vim.fn.expand("$XDG_DATA_HOME/nvim/swap")
vim.o.undodir = vim.fn.expand("$XDG_DATA_HOME/nvim/undo")
-- vim.o.fileformats = {'unix', 'dos', 'mac'}
-- vim.o.fileencodings=utf-8,sjis

------------------------------------------------------------
-- Folding
------------------------------------------------------------
vim.o.foldenable = true
vim.o.foldlevelstart = 99

------------------------------------------------------------
-- Spelling
------------------------------------------------------------
vim.o.spelllang = "en_us,cjk"
-- vim.o.spell = true

------------------------------------------------------------
-- System & Integration
------------------------------------------------------------
vim.o.clipboard = "unnamed"
vim.o.updatetime = 300
vim.o.grepprg = "rg --vimgrep"
-- vim.o.shortmess+=c
