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
      chars = {
        horizontal_line = "━",
        vertical_line = "┃",
        left_top = "┏",
        left_bottom = "┗",
        right_arrow = "━",
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
}

return M
