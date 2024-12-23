local M = {
  "shortcuts/no-neck-pain.nvim",
  lazy = false,
  keys = {
    { "<Leader>np", "<Cmd>NoNeckPain<CR>", mode = { "n" }, desc = "NoNeckPain" },
  },
  opts = {
    width = 140,
  },
}

return M
