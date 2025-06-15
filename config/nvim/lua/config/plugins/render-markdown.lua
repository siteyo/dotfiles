local M = {
  "MeanderingProgrammer/render-markdown.nvim",
  opts = {
    render_modes = { "n", "c", "t" },
    heading = {
      position = "inline",
      icons = { "◉ ", "◎ ", "○ ", "✺ ", "▶ ", "⤷ " },
    },
    bullet = {
      right_pad = 1,
      -- icons = { "•", "◦" },
    },
    checkbox = {
      enabled = true,
      right_pad = 0,
      unchecked = {
        icon = "󰄱 ",
        highlight = "RenderMarkdownUnchecked",
        scope_highlight = nil,
      },
      checked = {
        icon = "󰱒 ",
        highlight = "RenderMarkdownChecked",
        scope_highlight = "@markup.strikethrough",
      },
      custom = {
        todo = {
          raw = "[/]",
          rendered = "󰥔 ",
          highlight = "RenderMarkdownTodo",
          scope_highlight = nil,
        },
        cancel = {
          raw = "[-]",
          rendered = "󰜺 ",
          highlight = "RenderMarkdownWarn",
          scope_highlight = "@markup.strikethrough",
        },
        forward = {
          raw = "[>]",
          rendered = " ",
          highlight = "RenderMarkdownChecked",
          scope_highlight = "@markup.strikethrough",
        },
        delegate = {
          raw = "[<]",
          rendered = "󰙊 ",
          highlight = "RenderMarkdownChecked",
          scope_highlight = "@markup.strikethrough",
        },
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
