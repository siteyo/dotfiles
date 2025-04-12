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
      enabled = true,
      right_pad = 1,
      custom = {
        todo = { raw = "[/]", rendered = "󰥔 ", highlight = "RenderMarkdownTodo", scope_highlight = nil },
      },
    },
    indent = {
      enabled = true,
      skip_heading = true,
    },
  },
  ft = "markdown",
}

return M
