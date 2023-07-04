local M = {
  'lambdalisue/gin.vim',
  dependencies = {
    "vim-denops/denops.vim",
  },
  keys = "[Git]",
  config = function ()
    vim.keymap.set("n", "[Git]s", "<Cmd>GinStatus<CR>")
    vim.keymap.set("n", "[Git]h", "<Cmd>GinBranch<CR>")
    vim.keymap.set("n", "[Git]la", "<Cmd>GinLog --all --graph --oneline<CR>")
    vim.keymap.set("n", "[Git]ll", "<Cmd>GinLog --graph --oneline<CR>")
    vim.keymap.set("n", "[Git]c", "<Cmd>Gin commit<CR>")
  end,
  enabled = true,
}

return M
