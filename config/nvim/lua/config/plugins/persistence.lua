local M = {
  "folke/persistence.nvim",
  event = "bufReadPre",
  config = true,
  keys = {
    {
      "<Leader>qr",
      function()
        require("persistence").load()
        vim.notify("Persistence: Restore the sesssion for the current directory.")
      end,
      mode = { "n" },
      desc = "Restore Session (CWD)",
    },
    {
      "<Leader>ql",
      function()
        require("persistence").load({ last = true })
        vim.notify("Persistence: Restore the last sesssion.")
      end,
      mode = { "n" },
      desc = "Restore the Last Session",
    },
    {
      "<Leader>qs",
      function()
        require("persistence").stop()
        vim.notify("Persistence: Stop Persistence => session won't be saved on exit")
      end,
      mode = { "n" },
      desc = "Stop Persistence",
    },
  },
}

return M
