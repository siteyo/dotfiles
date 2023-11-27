-- Swap : and ;
vim.keymap.set({ "n", "i", "v", "x", "o", "c" }, ";", ":")
vim.keymap.set({ "n", "i", "v", "x", "o", "c" }, ":", ";")

-- Backslash
vim.keymap.set("c", "<C-k>", "\\")

-- Insert the path of the current file
vim.keymap.set("c", "%%", function()
  return vim.fn.getcmdtype() == ":" and vim.fn.expand("%:h") or "%%"
end, { expr = true })
vim.keymap.set("c", "%<Space>", "%")

-- Window & Tab & Buffer
vim.keymap.set("n", "s", "<Nop>")
vim.keymap.set("n", "S", "<Nop>")
vim.keymap.set("n", "sh", "<C-w>h")
vim.keymap.set("n", "sj", "<C-w>j")
vim.keymap.set("n", "sk", "<C-w>k")
vim.keymap.set("n", "sl", "<C-w>l")
-- vim.keymap.set("n", "<C-h>", "<C-w>h")
-- vim.keymap.set("n", "<C-j>", "<C-w>j")
-- vim.keymap.set("n", "<C-k>", "<C-w>k")
-- vim.keymap.set("n", "<C-l>", "<C-w>l")
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
vim.keymap.set("n", "ss", "<Cmd>sp<CR>")
vim.keymap.set("n", "sv", "<Cmd>vs<CR>")
vim.keymap.set("n", "s=", "<C-w>=")
vim.keymap.set("n", "s-", "<C-w>_")
vim.keymap.set("n", "s\\", "<C-w>|")

-- Refresh & noh
vim.keymap.set("n", "<C-l>", "<Cmd>noh<CR><C-l>")

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

-- Cmdline
vim.keymap.set("c", "<C-p>", function()
  if vim.fn.pumvisible() == 0 then
    vim.api.nvim_input("<Up>")
  else
    vim.api.nvim_input("<S-Tab>")
  end
end)
vim.keymap.set("c", "<C-n>", function()
  if vim.fn.pumvisible() == 0 then
    vim.api.nvim_input("<Down>")
  else
    vim.api.nvim_input("<Tab>")
  end
end)

-- Terminal
vim.keymap.set("t", "<C-n><C-n>", "<C-\\><C-n>")

-- Filer
vim.keymap.set("n", "[Filer]", "<Nop>")
vim.keymap.set("n", "<Space>e", "[Filer]", { remap = true })
-- FuzzyFinder
vim.keymap.set("n", "[FuzzyFinder]", "<Nop>")
vim.keymap.set("n", "<Space>f", "[FuzzyFinder]", { remap = true })
-- Git
vim.keymap.set("n", "[Git]", "<Nop>")
vim.keymap.set("n", "<Space>g", "[Git]", { remap = true })
vim.keymap.set("v", "<Space>g", "[Git]", { remap = true })
-- Lsp
vim.keymap.set("n", "[Lsp]", "<Nop>")
vim.keymap.set("n", "<Space>l", "[Lsp]", { remap = true })
-- Neorg
vim.keymap.set("n", "[Neorg]", "<Nop>")
vim.keymap.set("n", "<Space>o", "[Neorg]", { remap = true })
-- Noice
vim.keymap.set("n", "[Noice]", "<Nop")
vim.keymap.set("n", "<Space>n", "[Noice]", { remap = true })
