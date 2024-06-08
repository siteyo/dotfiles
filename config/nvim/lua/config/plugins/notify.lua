local M = {
  "rcarriga/nvim-notify",
  event = "VeryLazy",
  keys = {
    {
      "<Leader>un",
      function()
        require("notify").dismiss({ silent = true, pending = true })
      end,
      desc = "Dismiss All Notifications",
    },
  },
  opts = {
    timeout = 3000,
  },
  enabled = true,
}

return M
