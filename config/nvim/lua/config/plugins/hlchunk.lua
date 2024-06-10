local M = {
  "shellRaining/hlchunk.nvim",
  event = { "BufReadPost", "BufNewFile" },
  opts = {
    chunk = {
      enable = true,
      style = {
        { fg = "#336db3" },
        { fg = "#c21f30" },
      },
      use_treesitter = true,
    },
    indent = {
      enable = false,
      chars = { "│", "¦", "┆", "┊" },
    },
    blank = {
      enable = false,
    },
  },
}

return M
