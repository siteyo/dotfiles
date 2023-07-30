local M = {
  "ggandor/leap.nvim",
  keys = {
    { "fs", "<Plug>(leap-forward-to)", mode = { "n", "x" } },
    { "fS", "<Plug>(leap-backward-to)", mode = { "n", "x" } },
    { "fx", "<Plug>(leap-forward-till)", mode = { "x", "o" } },
    { "fX", "<Plug>(leap-backward-till)", mode = { "x", "o" } },
  },
  config = function()
    local leap = require("leap")
    leap.opts.safe_labels = {}
    leap.labels = { "a", "s", "d", "f", "g", "h", "j", "k", "l" }
  end,
  enabled = false,
}

return M
