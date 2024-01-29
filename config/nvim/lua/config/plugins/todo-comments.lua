return {
  "folke/todo-comments.nvim",
  dependencies = { "nvim-lua/plenary.nvim" },
  opts = {},
  event = "BufReadPre",
  cond = not vim.g.vscode,
}
