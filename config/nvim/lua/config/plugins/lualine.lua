local M = {
  "nvim-lualine/lualine.nvim",
  event = { "BufNewFile", "BufRead" },
}

M.opts = {
  options = {
    icons_enabled = true,
    theme = "auto",
    component_separators = { left = "", right = "" },
    section_separators = { left = "", right = "" },
    disabled_filetypes = {
      statusline = {},
      winbar = { "alpha" },
    },
    ignore_focus = {},
    always_divide_middle = true,
    globalstatus = true,
    refresh = {
      statusline = 1000,
      tabline = 1000,
      winbar = 1000,
    },
  },
  sections = {
    lualine_a = { "mode" },
    lualine_b = { "branch", "diff" },
    lualine_c = {
      { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
      { "filename", path = 1, symbols = { modified = "  ", readonly = "󰌾 ", unnamed = "" } },
    },
    lualine_x = {
      -- "overseer",
      { require("lazy.status").updates, cond = require("lazy.status").has_updates },
      "encoding",
      "fileformat",
    },
    lualine_y = { "progress" },
    lualine_z = { "location" },
  },
  -- inactive_sections = {
  --   lualine_a = {},
  --   lualine_b = {},
  --   lualine_c = { "filename" },
  --   lualine_x = { "location" },
  --   lualine_y = {},
  --   lualine_z = {},
  -- },
  tabline = {},
  winbar = {},
  inactive_winbar = {},
  extensions = {},
}

return M
