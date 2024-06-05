local M = {
  "kdheepak/lazygit.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  keys = {
    { "<Leader>gg", "<Cmd>LazyGit<CR>", mode = { "n" }, desc = "Lazygit" },
  },
  enabled = false,
}

return M
