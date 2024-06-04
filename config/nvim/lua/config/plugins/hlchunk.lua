local M = {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    chunk = {
      enable = true
    },
    indent = {
      enable = true,
      chars = { "│", "¦", "┆", "┊" },
    },
    blank = {
      enable = false,
    },
  },
}

return M
