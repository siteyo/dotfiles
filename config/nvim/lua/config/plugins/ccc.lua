local M = {
  "uga-rosa/ccc.nvim",
  event = "BufReadPost",
}

M.config = function()
  require("ccc").setup({
    highlighter = {
      auto_enable = true,
      lsp = true,
    },
  })
end

return M
