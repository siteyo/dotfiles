local null_ls = require("null-ls")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "[Lsp]f", vim.lsp.buf.format, opts)

null_ls.setup({
  sources = {
    -- formatting
    null_ls.builtins.formatting.stylua,
    -- diagnostics
    null_ls.builtins.diagnostics.zsh,
    -- completion
    null_ls.builtins.completion.spell,
  },
})
