local M = {
  "nvimtools/none-ls.nvim",
  event = "BufReadPre",
  opts = function()
    -- local opts = { noremap = true, silent = true }
    -- vim.keymap.set("n", "<Leader>lf", function()
    --   vim.lsp.buf.format({ async = true })
    -- end, opts)

    local nls = require("null-ls")
    return {
      sources = {
        --------------------
        --- code action
        --------------------
        -- nls.builtins.code_actions.refactoring,
        -- nls.builtins.code_actions.eslint,
        -- nls.builtins.code_actions.gitsigns,
        -- nls.builtins.code_actions.shellcheck,

        --------------------
        --- formatting
        --------------------
        -- nls.builtins.formatting.stylua.with({
        --   condition = function()
        --     return vim.fn.executable("stylua") > 0
        --   end,
        -- }),
        -- nls.builtins.formatting.shfmt.with({
        --   condition = function()
        --     return vim.fn.executable("shfmt") > 0
        --   end,
        -- }),
        -- nls.builtins.formatting.prettier.with({
        --   condition = function()
        --     return vim.fn.executable("prettier") > 0
        --   end,
        --   only_local = "node_modules/.bin",
        --   disabled_filetypes = { "markdown" },
        -- }),
        -- nls.builtins.formatting.rustfmt.with({
        --   condition = function()
        --     return vim.fn.executable("rustfmt") > 0
        --   end,
        -- }),
        -- nls.builtins.formatting.black.with({
        --   condition = function()
        --     return vim.fn.executable(".venv/bin/black") > 0
        --   end,
        --   only_local = ".venv/bin",
        -- }),
        -- nls.builtins.formatting.isort.with({
        --   condition = function()
        --     return vim.fn.executable(".venv/bin/isort") > 0
        --   end,
        --   only_local = ".venv/bin",
        -- }),

        --------------------
        --- diagnostics
        --------------------
        nls.builtins.diagnostics.zsh,
        nls.builtins.diagnostics.fish,
        nls.builtins.diagnostics.actionlint,
        nls.builtins.diagnostics.eslint.with({
          only_local = "node_modules/.bin",
        }),
        -- nls.builtins.diagnostics.textlint.with({
        --   condition = function()
        --     return vim.fn.executable("node_modules/.bin/textlint") > 0
        --   end,
        --   only_local = "node_modules/.bin",
        --   timeout = 30000,
        --   filetypes = { "markdown" },
        --   args = { "-f", "json", "--cache", "$DIRNAME" },
        --   method = nls.methods.DIAGNOSTICS_ON_SAVE,
        -- }),
        -- nls.builtins.diagnostics.markdownlint.with({
        --   condition = function()
        --     return vim.fn.executable("markdownlint") > 0
        --   end,
        --   method = nls.methods.DIAGNOSTICS_ON_SAVE,
        -- }),
        -- nls.builtins.diagnostics.markdownlint_cli2.with({
        --   condition = function()
        --     return vim.fn.executable("node_modules/.bin/markdownlint-cli2") > 0
        --   end,
        --   only_local = "node_modules/.bin",
        --   args = { "**/*.md", "#node_modules" },
        -- }),
        nls.builtins.diagnostics.selene.with({
          condition = function()
            return vim.fn.executable("selene") > 0
          end,
        }),
        nls.builtins.diagnostics.flake8.with({
          condition = function()
            return vim.fn.executable(".venv/bin/flake8") > 0
          end,
          only_local = ".venv/bin",
        }),
        nls.builtins.diagnostics.mypy.with({
          condition = function()
            return vim.fn.executable(".venv/bin/mypy") > 0
          end,
          only_local = ".venv/bin",
        }),
      },
    }
  end,
  enabled = false,
}
return M
