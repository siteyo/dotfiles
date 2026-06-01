vim.opt.formatoptions:remove({ "t", "c" })
vim.opt_local.wrap = true
vim.opt_local.spell = true
vim.opt_local.conceallevel = 2

vim.keymap.set("n", "j", "gj", { buffer = true })
vim.keymap.set("n", "k", "gk", { buffer = true })
