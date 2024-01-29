local M = {
  "folke/tokyonight.nvim",
  lazy = false,
  cond = not vim.g.vscode,
}

function M.config()
  local tokyonight = require("tokyonight")
  tokyonight.setup({
    style = "night",
    light_style = "day",
    transparent = true,
    styles = {
      comments = { italic = false },
      keywords = { italic = false },
      functions = { italic = false },
      variables = { italic = false },
    },
  })
  tokyonight.load()
end

return M
