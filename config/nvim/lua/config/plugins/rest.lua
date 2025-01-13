local M = {
  "rest-nvim/rest.nvim",
  cmd = "Rest",
  ft = "http",
  keys = {
    { "<Leader>rr", "<Cmd>Rest run<CR>", mode = { "n" } },
    { "<Leader>rs", "<Cmd>Rest env select<CR>", mode = { "n" } },
    { "<Leader>rc", "<Cmd>Rest cookies<CR>", mode = { "n" } },
  },
  config = function()
    vim.g.rest_nvim = {}
  end,
}

return M
