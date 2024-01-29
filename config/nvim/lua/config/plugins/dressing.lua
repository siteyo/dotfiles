local M = {
  "stevearc/dressing.nvim",
  config = true,
  event = "VeryLazy",
  cond = not vim.g.vscode,
}

return M
