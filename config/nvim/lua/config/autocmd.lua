local nvim_terminal = vim.api.nvim_create_augroup("nvim_terminal", { clear = false })
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  group = nvim_terminal,
  command = "setlocal nonumber norelativenumber",
})
