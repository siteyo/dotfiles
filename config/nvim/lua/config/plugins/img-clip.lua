local M = {
  "HakonHarnes/img-clip.nvim",
  event = "VeryLazy",
  cmd = "PasteImage",
  opts = {},
  keys = {
    {
      "<Leader>o",
      "<Cmd>PasteImage<CR>",
      desc = "Paste Image",
    },
  },
  enabled = false,
}

return M
