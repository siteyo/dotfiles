require("bufferline").setup({
  options = {
    mode = "buffers",
    numbers = function(opts)
      return string.format("%s.%s", opts.ordinal, opts.raise(opts.id))
    end,
    indicator = {
      style = "underline",
    },
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or ""
      return " " .. icon .. count
    end,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    separator_style = "slant",
  },
  highlights = require("catppuccin.groups.integrations.bufferline").get({ styles = { "bold" } }),
})
