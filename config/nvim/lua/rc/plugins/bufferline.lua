require('bufferline').setup({
  options = {
    mode = 'buffers',
    numbers = function(opts)
      return string.format('%s.%s', opts.ordinal, opts.raise(opts.id))
    end,
    indicator = {
      icon = '▎',
      style = 'underline',
    },
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
  },
  highlights = {
    buffer_selected = {
      italic = false,
    },
    numbers_selected = {
      bold = false,
      italic = false,
    }
  }
})
