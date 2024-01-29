local M = {
  "folke/trouble.nvim",
  dependencies = { "nvim-tree/nvim-web-devicons" },
  cmd = "Trouble",
  cond = not vim.g.vscode,
}

function M.config()
  local trouble = require("trouble")
  trouble.setup({
    signs = {
      -- icons / text used for a diagnostic
      error = " ",
      warning = " ",
      hint = " ",
      information = "﫠",
      other = "﫠",
    },
  })
end

return M
