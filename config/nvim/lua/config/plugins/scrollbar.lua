return {
  "petertriho/nvim-scrollbar",
  config = function()
    local colors = require("tokyonight.colors").setup()
    require("scrollbar").setup({
      handle = {
        color = colors.bg_highlight,
      },
      excluded_filetypes = { "noice" },
      marks = {
        Search = { color = colors.orange },
        Error = { color = colors.error },
        Warn = { color = colors.warning },
        Info = { color = colors.info },
        Hint = { color = colors.hint },
        Misc = { color = colors.purple },
      },
    })
  end,
  event = "BufReadPost",
  cond = not vim.g.vscode,
}
