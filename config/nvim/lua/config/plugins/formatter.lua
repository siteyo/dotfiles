local M = {
  "mhartington/formatter.nvim",
  cmd = "Format",
  enabled = false,
}

M.config = function()
  local ft = require("formatter.filetypes")
  require("formatter").setup({
    logging = true,
    filetype = {
      lua = { ft.lua.stylua },
      sh = { ft.sh.shfmt },
      ["*"] = { ft.any.remove_trailing_whitespace },
    },
  })
end

return M
