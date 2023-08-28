local M = {
  "mhartington/formatter.nvim",
  cmd = "Format",
  opts = {
    logging = true,
  },
  config = function()
    local fmt = require("formatter")
    fmt.setup({
      logging = true,
      filetype = {
        ["*"] = {
          require("formatter.filetypes.any").remove_trailing_whitespace,
        },
      },
    })
  end,
}

return M
