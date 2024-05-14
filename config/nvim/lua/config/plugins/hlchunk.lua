local M = {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    indent = {
      chars = { "│", "¦", "┆", "┊" },
    },
    blank = {
      enable = false,
    },
  },
}

return M
