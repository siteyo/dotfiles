local M = {
  "folke/tokyonight.nvim",
  lazy = false,
}

function M.config()
  local tokyonight = require("tokyonight")
  tokyonight.setup({
    style = "night",
    light_style = "day",
    -- transparent = (function()
    --   if vim.o.background:match(".*light.*") then
    --     return false
    --   end
    --   return true
    -- end)(),
    transparent = false,
    styles = {
      comments = { italic = false },
      keywords = { italic = false },
      functions = { italic = false },
      variables = { italic = false },
    },
    -- day_brightness = 0.4,
    on_colors = function(colors)
      colors.border = colors.blue0
    end,
  })
  tokyonight.load()
  vim.o.background = require("config.util").appearance()
end

return M
