local M = {
  "uga-rosa/ccc.nvim",
  event = "BufReadPost",
  enabled = true,
}

M.config = function()
  require("ccc").setup({
    highlighter = {
      auto_enable = true,
      lsp = true,
      excludes = {
        "lazy",
      },
    },
  })
end

return M
