local M = {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    render_modes = true,
    heading = {
      position = "inline",
      icons = { "◉ ", "◎ ", "○ ", "✺ ", "▶ ", "⤷ " },
    },
    bullet = {
      right_pad = 1,
      icons = { "•", "◦" },
    },
    checkbox = {
      right_pad = 5,
    },
    indent = {
      enabled = true,
      skip_heading = true,
    },
  },
  ft = "markdown",
}

return M
