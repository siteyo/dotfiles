local M = {
  "folke/tokyonight.nvim",
  lazy = false,
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
    -- day_brightness = 0.4,
  })
  tokyonight.load()
end

return M
