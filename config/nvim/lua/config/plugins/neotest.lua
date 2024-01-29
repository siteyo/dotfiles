local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
  },
  cond = not vim.g.vscode,
}

M.config = function()
  require("neotest").setup({
    adapters = {
      require("neotest-plenary"),
    },
  })
end

return M
