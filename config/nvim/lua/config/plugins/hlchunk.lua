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
      exclude_filetypes = {
        oil = true,
        orgagenda = true,
      },
    },
    indent = {
      enable = false,
      chars = { "│", "¦", "┆", "┊" },
    },
    blank = {
      enable = false,
    },
  },
  enabled = false,
}

return M
