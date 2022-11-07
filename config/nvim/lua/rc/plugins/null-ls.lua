local null_ls = require("null-ls")

local opts = { noremap = true, silent = true }
vim.keymap.set("n", "[Lsp]f", vim.lsp.buf.format, opts)

null_ls.setup({
  sources = {
    -- code action
    null_ls.builtins.code_actions.gitsigns,
    null_ls.builtins.code_actions.eslint,
    null_ls.builtins.code_actions.shellcheck,
    null_ls.builtins.code_actions.refactoring,
    -- formatting
    null_ls.builtins.formatting.stylua,
    null_ls.builtins.formatting.eslint,
    null_ls.builtins.formatting.prettier,
    -- diagnostics
    null_ls.builtins.diagnostics.zsh,
    -- completion
    null_ls.builtins.completion.spell,
  },
})
