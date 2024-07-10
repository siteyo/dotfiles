local neorg = vim.api.nvim_create_augroup("neorg", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  pattern = "*.norg",
  group = neorg,
  command = "setlocal conceallevel=2",
})
