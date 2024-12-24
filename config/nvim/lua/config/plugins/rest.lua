local M = {
  "rest-nvim/rest.nvim",
  cmd = "Rest",
  ft = "http",
  config = function()
    vim.g.rest_nvim = {}
  end,
}

return M
