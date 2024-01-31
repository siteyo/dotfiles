local M = {
  "ThePrimeagen/refactoring.nvim",
  enabled = false,
  dependencies = {
    "nvim-treesitter/nvim-treesitter",
  },
  config = function()
    require("refactoring").setup({})
  end,
}

return M
