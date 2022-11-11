local null_ls = require("null-ls")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "[Lsp]f", function()
  vim.lsp.buf.format({ async = true })
end, opts)

null_ls.setup({
  sources = {
    --- code action
    -- null_ls.builtins.code_actions.refactoring,
    --- formatting
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.prettier,
    --- diagnostics
    null_ls.builtins.diagnostics.zsh,
    --- completion
    null_ls.builtins.completion.spell,
  },
})
