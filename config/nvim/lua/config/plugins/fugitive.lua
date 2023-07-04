local M = {
  "tpope/vim-fugitive",
  keys = "[Git]",
  enabled = false,
  cmd = { "Git", "G" },
}

M.config = function()
  vim.keymap.set("n", "[Git]s", "<Cmd>Git<CR>")
  vim.keymap.set("n", "[Git]c", "<Cmd>Git commit<CR>")
  vim.keymap.set("n", "[Git]b", "<Cmd>Git blame<CR>")
  vim.keymap.set("n", "[Git]m", "<Cmd>Git merge<CR>")
  vim.keymap.set("n", "[Git]h", "<Cmd>Git branch<CR>")
  vim.keymap.set("n", "[Git]ll", "<Cmd>Git log --graph<CR>")
  vim.keymap.set("n", "[Git]la", "<Cmd>Git log --graph --all --decorate=full<CR>")
end

return M
