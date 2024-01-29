local M = {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  keys = { { "<Leader>gg", "<Cmd>LazyGit<CR>", mode = { "n" } } },
  cond = not vim.g.vscode,
}

return M
