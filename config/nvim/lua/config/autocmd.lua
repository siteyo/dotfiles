local terminal = vim.api.nvim_create_augroup("nvim_terminal", { clear = true })
vim.api.nvim_create_autocmd({ "TermOpen" }, {
  group = terminal,
  command = "setlocal nonumber norelativenumber",
})

-- local filetypes = vim.api.nvim_create_augroup("nvim_filetypes", { clear = true })
-- vim.api.nvim_create_autocmd({ "BufReadPre" }, {
--   group = filetypes,
--   pattern = "*.md",
--   command = "setlocal wrap",
-- })
