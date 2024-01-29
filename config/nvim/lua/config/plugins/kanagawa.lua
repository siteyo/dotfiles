local M = {
  "rebelot/kanagawa.nvim",
  lazy = false,
  cond = not vim.g.vscode,
}

function M.config()
  local kanagawa = require("kanagawa")
  kanagawa.setup({
    compile = false,
    undercurl = true,
    commentStyle = { italic = false },
    functionStyle = {},
    keywordStyle = { italic = false },
    statementStyle = { bold = true },
    typeStyle = {},
    transparent = true,
    dimInactive = false,
    terminalColors = true,
    theme = "wave",
    background = {
      dark = "wave", -- try "dragon" !
      light = "lotus",
    },
  })
  -- vim.cmd("colorscheme kanagawa")
end

return M
