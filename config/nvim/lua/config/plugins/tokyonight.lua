local M = {
  "folke/tokyonight.nvim",
}

function M.config()
  local tokyonight = require("tokyonight")
  tokyonight.setup({
    style = "storm",
    light_style = "day",
    transparent = false,
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
