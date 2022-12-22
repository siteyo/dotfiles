local M = {
  "rcarriga/nvim-notify",
  dependencies = "nvim-telescope/telescope.nvim",
}

function M.config()
  local notify = require("notify")
  vim.notify = notify

  require("telescope").load_extension("notify")

  notify.setup({
    background_colour = "#000000",
  })
end

return M
