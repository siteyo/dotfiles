local M = {
  "mikavilpas/yazi.nvim",
  version = "*",
  event = "VeryLazy",
  dependencies = { "nvim-lua/plenary.nvim" },
  cmd = "Yazi",
  keys = {
    {
      "<leader>--",
      mode = { "n", "v" },
      "<cmd>Yazi<cr>",
      desc = "Open yazi at the current file",
    },
    {
      -- Open in the current working directory
      "<leader>-w",
      "<cmd>Yazi cwd<cr>",
      desc = "Open the file manager in nvim's working directory",
    },
    {
      "<c-up>",
      "<cmd>Yazi toggle<cr>",
      desc = "Resume the last yazi session",
    },
  },
  opts = {
    open_for_directories = false,
    keymaps = {
      show_help = "<f1>",
    },
  },
}

return M
