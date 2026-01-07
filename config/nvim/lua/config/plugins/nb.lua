local M = {
  "siteyo/nb.nvim",
  dependencies = {
    "folke/snacks.nvim",
  },
  event = "VeryLazy",
  opts = {
    template_dir = vim.fn.expand("$XDG_DATA_HOME/nvim/nb"),
  },
  keys = {
    {
      "<Leader>od",
      function()
        require("nb.commands.notes").pick()
      end,
      mode = { "n" },
    },
  },
  dev = true,
}

return M
