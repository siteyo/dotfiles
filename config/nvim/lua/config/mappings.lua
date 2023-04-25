-- Swap : and ;
vim.keymap.set({ "n", "i", "v" }, ";", ":")
vim.keymap.set({ "n", "i", "v" }, ":", ";")

-- Window & Tab & Buffer
vim.keymap.set("n", "s", "<Nop>")
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sl", "<C-w>l")
vim.keymap.set("n", "sH", "<C-w>H")
vim.keymap.set("n", "sJ", "<C-w>J")
vim.keymap.set("n", "sK", "<C-w>K")
vim.keymap.set("n", "sL", "<C-w>L")
vim.keymap.set("n", "sN", "gt")
vim.keymap.set("n", "sP", "gt")
vim.keymap.set("n", "sn", "<cmd>bn<cr>")
vim.keymap.set("n", "sp", "<Cmd>bp<CR>")
vim.keymap.set("n", "st", "<Cmd>tabnew<CR>")
vim.keymap.set("n", "se", "<Cmd>enew<CR>")
vim.keymap.set("n", "ss", "<Cmd>sp<CR><C-w>w")
vim.keymap.set("n", "sv", "<Cmd>vs<CR><C-w>w")
vim.keymap.set("n", "s=", "<C-w>=")

-- Quit
vim.keymap.set("n", "sq", "<Cmd>q<CR>")
vim.keymap.set("n", "sQ", "<Cmd>q!<CR>")
vim.keymap.set("n", "sd", "<Cmd>bd<CR>")
vim.keymap.set("n", "sD", "<Cmd>bd!<CR>")

-- Jump in line
vim.keymap.set({ "n", "v", "o" }, "<S-h>", "^")
vim.keymap.set({ "n", "v", "o" }, "<S-l>", "$")

-- -- Jump in paragraph
-- vim.keymap.set('n', '<S-j>', '}')
-- vim.keymap.set('n', '<S-k>', '{')

-- Do not yank when deleting character with x
vim.keymap.set({ "n", "v" }, "x", '"_x')

-- Quickfix
vim.keymap.set("n", "[q", "<Cmd>cprevious<CR>")
vim.keymap.set("n", "]q", "<Cmd>cnext<CR>")

-- ESC alias
vim.keymap.set("i", "jk", "<ESC>")
vim.keymap.set("i", "j<Space>", "j")

-- Jump cursor position
vim.keymap.set("i", "<C-f>", "<Right>")
vim.keymap.set("i", "<C-b>", "<Left>")
vim.keymap.set("i", "<C-e>", "<ESC>A")
vim.keymap.set("i", "<C-a>", "<ESC>I")

-- Operator
vim.keymap.set("o", "[", "i[")
vim.keymap.set("o", "{", "i{")

-- Terminal
vim.keymap.set("t", "<C-n><C-n>", "<C-\\><C-n>")

--- Plugins prefix
local prefix_opts = { noremap = true, silent = true }
-- Filer
vim.api.nvim_set_keymap("n", "[Filer]", "<Nop>", prefix_opts)
vim.api.nvim_set_keymap("n", "<Space>e", "[Filer]", {})
-- FuzzyFinder
vim.api.nvim_set_keymap("n", "[FuzzyFinder]", "<Nop>", prefix_opts)
vim.api.nvim_set_keymap("n", "<Space>f", "[FuzzyFinder]", {})
-- Git
vim.api.nvim_set_keymap("n", "[Git]", "<Nop>", prefix_opts)
vim.api.nvim_set_keymap("n", "<Space>g", "[Git]", {})
-- Lsp
vim.api.nvim_set_keymap("n", "[Lsp]", "<Nop>", prefix_opts)
vim.api.nvim_set_keymap("n", "<Space>l", "[Lsp]", {})
-- Mind
-- vim.api.nvim_set_keymap("n", "[Mind]", "<Nop>", prefix_opts)
-- vim.api.nvim_set_keymap("n", "<Space>m", "[Mind]", {})

-- vim.api.nvim_set_keymap("n", "[Neorg]", "<Nop>", prefix_opts)
-- vim.api.nvim_set_keymap("n", "<Space>o", "[Neorg]", {})
