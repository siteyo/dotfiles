local M = {
  "siteyo/nb.nvim",
  dependencies = {
    "folke/snacks.nvim",
  },
  event = "VeryLazy",
  opts = {
    template_dir = vim.fn.expand("$XDG_DATA_HOME/nvim/nb"),
  },
  cmd = "Nb",
  keys = {
    { "<Leader>oq", "<Cmd>Nb notes<CR>", mode = { "n" } },
    { "<Leader>ot", "<Cmd>Nb tags notes<CR>", mode = { "n" } },
  },
  dev = true,
}

return M
