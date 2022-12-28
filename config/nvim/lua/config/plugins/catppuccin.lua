local M = {
  "catppuccin/nvim",
  name = "catppuccin",
}

-- function M.init()
--   vim.cmd.colorscheme("catppuccin")
-- end

function M.config()
  local catppuccin = require("catppuccin")
  catppuccin.setup({
    flavour = "mocha",
    transparent_background = false,
    no_italic = true,
    styles = {
      comments = {},
      conditionals = {},
      loops = {},
      functions = {},
      keywords = {},
      strings = {},
      variables = {},
      numbers = {},
      booleans = {},
      properties = {},
      types = {},
      operators = {},
    },
    integrations = {
      cmp = true,
      gitsigns = true,
      nvimtree = true,
      telescope = true,
      treesitter = true,
      mason = true,
      notify = true,
      fidget = true,
      lsp_saga = true,
      neotree = true,
      native_lsp = {
        enabled = true,
        virtual_text = {
          errors = {},
          hints = {},
          warnings = {},
          information = {},
        },
        underlines = {
          errors = { "underline" },
          hints = { "underline" },
          warnings = { "underline" },
          information = { "underline" },
        },
      },
    },
  })
end

return M
