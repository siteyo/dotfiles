return {
  "petertriho/nvim-scrollbar",
  config = function()
    local colors = require("tokyonight.colors").setup()
    require("scrollbar").setup({
      exclude = { filetypes = { "noice" } },
      marks = {
        Search = { highlight = { fg = colors.orange } },
        Error = { highlight = { fg = colors.error } },
        Warn = { highlight = { fg = colors.warning } },
        Info = { highlight = { fg = colors.info } },
        Hint = { highlight = { fg = colors.hint } },
        Misc = { highlight = { fg = colors.purple } },
      },
      scrollbar = {
        thumb = {
          highlight = { bg = colors.bg_highlight },
        },
      },
    })
  end,
  event = "BufReadPost",
}
