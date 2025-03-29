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
    transparent = true,
    styles = {
      comments = { italic = false },
      keywords = { italic = false },
      functions = { italic = false },
      variables = { italic = false },
    },
    -- day_brightness = 0.4,
    on_colors = function(colors)
      colors.border = colors.blue0
      colors.fg_gutter = colors.dark3
    end,
    on_highlights = function(hl, c)
      hl["@markup.link.url"] = {
        fg = c.blue6,
        underline = true,
      }
      hl["@org.agenda.scheduled"] = {
        fg = hl["diffAdded"].fg,
      }
    end,
  })
  tokyonight.load()
  vim.o.background = require("config.util").appearance()
end

return M
