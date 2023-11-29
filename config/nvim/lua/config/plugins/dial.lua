local M = {
  "monaqa/dial.nvim",
  keys = {
    {
      "<C-a>",
      "<Plug>(dial-increment)",
      mode = { "n", "x" },
      desc = "Dial increment",
    },
    {
      "<C-x>",
      "<Plug>(dial-decrement)",
      mode = { "n", "x" },
      desc = "Dial decrement",
    },
    -- {
    --   "g<C-a>",
    --   "g<Plug>(dial-increment)",
    --   mode = { "v" },
    --   desc = "Dial visual increment",
    -- },
    -- {
    --   "g<C-x>",
    --   "g<Plug>(dial-decrement)",
    --   mode = { "x" },
    --   desc = "Dial visual decrement",
    -- },
  },
}

return M
