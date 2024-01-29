local M = {
  "uga-rosa/ccc.nvim",
  event = "BufReadPost",
  cond = not vim.g.vscode,
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
