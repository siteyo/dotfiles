local M = {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  event = "VeryLazy",
  keys = { { "<Leader>gg", "<Cmd>LazyGit<CR>", mode = { "n" } } },
}

return M
