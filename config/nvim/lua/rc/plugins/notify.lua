vim.notify = require("notify")

require("telescope").load_extension("notify")

require("notify").setup({
  background_colour = "#000000",
})
