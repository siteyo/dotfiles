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

-- Resize window [<leader>w]
map_s("n", "<leader>wk", "k", "<cmd>resize +2<cr>", { desc = "Increase Window Height" })
map_s("n", "<leader>wj", "j", "<cmd>resize -2<cr>", { desc = "Decrease Window Height" })
map_s("n", "<leader>wh", "h", "<cmd>vertical resize -2<cr>", { desc = "Decrease Window Width" })
map_s("n", "<leader>wl", "l", "<cmd>vertical resize +2<cr>", { desc = "Increase Window Width" })
map("n", "<leader>w0", "<C-w>=", { desc = "Equalize Window sizes" })
map("n", "<leader>w-", "<C-w>_", { desc = "Maximize Window Height" })
map("n", "<leader>w\\", "<C-w>|", { desc = "Maximize Window Width" })
map("n", "s0", "<C-w>=", { desc = "Equalize Window sizes" })
map("n", "s-", "<C-w>_", { desc = "Maximize Window Height" })
map("n", "s\\", "<C-w>|", { desc = "Maximize Window Width" })

-- Split window
map("n", "ss", "<cmd>split<cr>", { desc = "Split window Below" })
map("n", "sv", "<cmd>vsplit<cr>", { desc = "Split window Right" })

-- Close window [<leader>w]
map("n", "<leader>wd", "<cmd>close<cr>", { desc = "Close window" })

-- tabs [<leader>t]
map("n", "<leader>tl", "<cmd>tablast<cr>", { desc = "Last Tab" })
map("n", "<leader>tf", "<cmd>tabfirst<cr>", { desc = "First Tab" })
map("n", "<leader>tt", "<cmd>tabnew<cr>", { desc = "New Tab" })
map("n", "<leaderrtn", "<cmd>tabnext<cr>", { desc = "Next Tab" })
map("n", "<leader>tc", "<cmd>tabclose<cr>", { desc = "Close Tab" })
map("n", "<leader>tp", "<cmd>tabprevious<cr>", { desc = "Previous Tab" })

-- buffers
map("n", "sp", "<cmd>bprevious<cr>", { desc = "Prev Buffer" })
map("n", "sn", "<cmd>bnext<cr>", { desc = "Next Buffer" })
map("n", "sd", "<cmd>bdelete<cr>", { desc = "Delete Buffer" })
map("n", "sD", "<cmd>bdelete!<cr>", { desc = "Delete Buffer" })

-- Move Lines [<leader>m]
map_s("n", "<leader>mj", "j", "<cmd>m .+1<cr>==", { desc = "Move Down", silent = true })
map_s("n", "<leader>mk", "k", "<cmd>m .-2<cr>==", { desc = "Move Up", silent = true })
map_s("v", "<leader>mj", "j", ":m '>+1<cr>gv=gv", { desc = "Move Down", silent = true })
map_s("v", "<leader>mk", "k", ":m '<-2<cr>gv=gv", { desc = "Move Up", silent = true })

-- Jump in line
map({ "n", "v", "o" }, "<S-h>", "^")
map({ "n", "v", "o" }, "<S-l>", "$")

-- ESC alias
map("i", "jk", "<ESC>")
map("i", "j<Space>", "j")

-- Clear search [<leader>u]
map("n", "<leader>ur", "<cmd>noh<cr><C-l>", { desc = "Redraw / Clear hlsearch" })
map("n", "<C-l>", "<cmd>noh<cr><C-l>", { desc = "Redraw / Clear hlsearch" })

-- stylua: ignore start

-- toggle [<leader>u]
map("n", "<leader>us", function() toggle("spell") end, { desc = "Toggle Spelling" })
map("n", "<leader>uw", function() toggle("wrap") end, { desc = "Toggle Word Wrap" })
map("n", "<leader>ul", function() toggle("relativenumber") end, { desc = "Toggle Relative Line Numbers" })
map("n", "<leader>ub", function() toggle("background", false, { "light", "dark" }) end, { desc = "Toggle Relative Line Numbers" })

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
map("n", "[q", "<cmd>cprevious<cr>", { desc = "Previous Quickfix" })
map("n", "]q", "<cmd>cnext<cr>", { desc = "Next Quickfix" })

-- better indenting
map("v", "<", "<gv")
map("v", ">", ">gv")

-- Jump cursor position
map("i", "<C-f>", "<right>")
map("i", "<C-b>", "<left>")
map("i", "<C-e>", "<esc>A")
map("i", "<C-a>", "<esc>I")

-- new file
map("n", "se", "<cmd>enew<cr>", { desc = "New File" })

-- quit [<leader>q]
map("n", "<leader>qq", "<cmd>aq<cr>", { desc = "quit All" })
map("n", "sq", "<cmd>q<cr>", { desc = "quit" })

-- Terminal
map("t", "<C-n><C-n>", "<C-\\><C-n>", { desc = "Enter Normal Mode" })
map("t", "<C-h>", "<cmd>wincmd h<cr>", { desc = "Go to Left Window" })
map("t", "<C-j>", "<cmd>wincmd j<cr>", { desc = "Go to Lower Window" })
map("t", "<C-k>", "<cmd>wincmd k<cr>", { desc = "Go to Upper Window" })
map("t", "<C-l>", "<cmd>wincmd l<cr>", { desc = "Go to Right Window" })
