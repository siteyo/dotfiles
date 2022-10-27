require('bufferline').setup({
  options = {
    mode = 'buffers',
    numbers = 'original',
    indicator = {
      icon = '▎',
      style = 'underline',
    },
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
