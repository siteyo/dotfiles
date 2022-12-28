local M = {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
}

function M.config()
  local notify = require("notify")
  vim.notify = notify

  notify.setup({
    background_colour = "#000000",
  })
end

return M
