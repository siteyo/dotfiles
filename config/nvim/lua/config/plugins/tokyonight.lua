local M = {
  "folke/tokyonight.nvim",
  lazy = false,
}

function M.config()
  local tokyonight = require("tokyonight")
  tokyonight.setup({
    style = "night",
    light_style = "day",
    transparent = not vim.g.neovide == nil,
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
