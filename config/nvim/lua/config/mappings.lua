------------------------------------------------------------
--- mappings.lua
------------------------------------------------------------
local map = vim.keymap.set
local map_s = require("config.util").map_submode
local toggle = require("config.util").toggle

-- for utility
map("n", "s", "<Nop>")
map("n", "S", "<Nop>")

-- Swap : and ;
map({ "n", "i", "v", "x", "o", "c" }, ";", ":")
map({ "n", "i", "v", "x", "o", "c" }, ":", ";")

-- visually up/down
map_s({ "n", "x" }, "gj", "gj", "j", { desc = "Visually Down", silent = true })
map_s({ "n", "x" }, "gk", "gk", "k", { desc = "Visually Up", silent = true })

-- Move to window
map("n", "sh", "<C-w>h", { desc = "Go to Left Window" })
map("n", "sj", "<C-w>j", { desc = "Go to Lower Window" })
map("n", "sk", "<C-w>k", { desc = "Go to Upper Window" })
map("n", "sl", "<C-w>l", { desc = "Go to Right Window" })
map("n", "sH", "<C-w>H", { desc = "Move window to Left" })
map("n", "sJ", "<C-w>J", { desc = "Move window to Lower" })
map("n", "sK", "<C-w>K", { desc = "Move window to Upper" })
map("n", "sL", "<C-w>L", { desc = "Move window to Right" })

-- Resize window [<Leader>w]
map_s("n", "<Leader>wk", "k", "<Cmd>resize +2<CR>", { desc = "Increase Window Height" })
map_s("n", "<Leader>wj", "j", "<Cmd>resize -2<CR>", { desc = "Decrease Window Height" })
map_s("n", "<Leader>wh", "h", "<Cmd>vertical resize -2<CR>", { desc = "Decrease Window Width" })
map_s("n", "<Leader>wl", "l", "<Cmd>vertical resize +2<CR>", { desc = "Increase Window Width" })
map("n", "<Leader>w0", "<C-w>=", { desc = "Equalize Window sizes" })
map("n", "<Leader>w-", "<C-w>_", { desc = "Maximize Window Height" })
map("n", "<Leader>w\\", "<C-w>|", { desc = "Maximize Window Width" })
map("n", "s0", "<C-w>=", { desc = "Equalize Window sizes" })
map("n", "s-", "<C-w>_", { desc = "Maximize Window Height" })
map("n", "s\\", "<C-w>|", { desc = "Maximize Window Width" })

-- Split window
map("n", "ss", "<Cmd>split<CR>", { desc = "Split window Below" })
map("n", "sv", "<Cmd>vsplit<CR>", { desc = "Split window Right" })

-- Close window [<Leader>w]
map("n", "<Leader>wd", "<Cmd>close<CR>", { desc = "Close window" })

-- tabs [<Leader>t]
map("n", "<Leader>tl", "<Cmd>tablast<CR>", { desc = "Last Tab" })
map("n", "<Leader>tf", "<Cmd>tabfirst<CR>", { desc = "First Tab" })
map("n", "<Leader>tt", "<Cmd>tabnew<CR>", { desc = "New Tab" })
map("n", "<Leader>tn", "<Cmd>tabnext<CR>", { desc = "Next Tab" })
map("n", "<Leader>tc", "<Cmd>tabclose<CR>", { desc = "Close Tab" })
map("n", "<Leader>tp", "<Cmd>tabprevious<CR>", { desc = "Previous Tab" })
map("n", "sN", "<Cmd>tabnext<CR>", { desc = " Next Tab" })
map("n", "sP", "<Cmd>tabprevious<CR>", { desc = "Previous Tab" })

-- buffers
map("n", "sp", "<Cmd>bprevious<CR>", { desc = "Prev Buffer" })
map("n", "sn", "<Cmd>bnext<CR>", { desc = "Next Buffer" })
map("n", "sd", "<Cmd>bdelete<CR>", { desc = "Delete Buffer" })
map("n", "sD", "<Cmd>bdelete!<CR>", { desc = "Delete Buffer" })

-- Move Lines [<Leader>m]
map_s("n", "<Leader>mj", "j", "<Cmd>m .+1<CR>==", { desc = "Move Down", silent = true })
map_s("n", "<Leader>mk", "k", "<Cmd>m .-2<CR>==", { desc = "Move Up", silent = true })
map_s("v", "<Leader>mj", "j", ":m '>+1<CR>gv=gv", { desc = "Move Down", silent = true })
map_s("v", "<Leader>mk", "k", ":m '<-2<CR>gv=gv", { desc = "Move Up", silent = true })

-- Jump in line
map({ "n", "v", "o" }, "<S-h>", "^")
map({ "n", "v", "o" }, "<S-l>", "$")

-- ESC alias
map("i", "jk", "<ESC>")
map("i", "j<Space>", "j")

-- Clear search [<Leader>u]
map("n", "<Leader>ur", "<Cmd>noh<CR><C-l>", { desc = "Redraw / Clear hlsearch" })
map("n", "<C-l>", "<Cmd>noh<CR><C-l>", { desc = "Redraw / Clear hlsearch" })

-- stylua: ignore start

-- toggle [<Leader>u]
map("n", "<Leader>us", function() toggle("spell") end, { desc = "Toggle Spelling" })
map("n", "<Leader>uw", function() toggle("wrap") end, { desc = "Toggle Word Wrap" })
map("n", "<Leader>ul", function() toggle("relativenumber") end, { desc = "Toggle Relative Line Numbers" })
map("n", "<Leader>ub", function() toggle("background", false, { "light", "dark" }) end, { desc = "Toggle Relative Line Numbers" })

-- stylua: ignore end

-- Backslash
map("c", "<C-k>", "\\")

-- Insert the path of the current file
map("c", "%%", function()
  return vim.fn.getcmdtype() == ":" and vim.fn.expand("%:h") or "%%"
end, { expr = true })
map("c", "%<space>", "%")

-- Do not yank when deleting character with x
map({ "n", "v" }, "x", '"_x')

-- Quickfix
map("n", "[q", "<Cmd>cprevious<CR>", { desc = "Previous Quickfix" })
map("n", "]q", "<Cmd>cnext<CR>", { desc = "Next Quickfix" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Jump cursor position
map("i", "<C-f>", "<Right>")
map("i", "<C-b>", "<Left>")
map("i", "<C-e>", "<ESC>A")
map("i", "<C-a>", "<ESC>I")

-- new file
map("n", "se", "<Cmd>enew<CR>", { desc = "New File" })

-- quit [<Leader>q]
map("n", "<Leader>qq", "<Cmd>qa<CR>", { desc = "quit All" })
map("n", "sq", "<Cmd>q<CR>", { desc = "quit" })

-- Terminal
map("t", "<C-n><C-n>", "<C-\\><C-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<Cmd>wincmd h<CR>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<Cmd>wincmd j<CR>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<Cmd>wincmd k<CR>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<Cmd>wincmd l<CR>", { desc = "Go to Right Window" })
