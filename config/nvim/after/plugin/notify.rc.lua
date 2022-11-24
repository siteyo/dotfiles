local status, notify = pcall(require, "notify")
if not status then return end

vim.notify = notify

require("telescope").load_extension("notify")

require("notify").setup({
  background_colour = "#000000",
})
