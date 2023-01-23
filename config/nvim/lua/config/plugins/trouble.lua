local M = {
  "folke/trouble.nvim",
  dependencies = { "kyazdani42/nvim-web-devicons" },
  cmd = "Trouble",
}

function M.config()
  local trouble = require("trouble")
  trouble.setup({
    signs = {
      -- icons / text used for a diagnostic
      error = " ",
      warning = " ",
      hint = " ",
      information = "﫠",
      other = "﫠",
    },
  })
end

return M