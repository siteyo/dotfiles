local M = {
  "nvim-neotest/neotest",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "antoinemadec/FixCursorHold.nvim",
  },
}

M.config = function()
  require("neotest").setup({
    adapters = {
      require("neotest-plenary"),
    },
  })
end

return M
