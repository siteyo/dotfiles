local M = {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      css = { "prettier" },
      javascript = { "prettier" },
      javascriptreact = { "prettier" },
      json = { "fixjson" },
      lua = { "stylua" },
      python = { "black", "isort" },
      rust = { "rustfmt" },
      sh = { "shfmt" },
      typescript = { "prettier" },
      typescriptreact = { "prettier" },
      yaml = { "yamlfmt" },
      ["_"] = { "trim_whitespace" },
    },
    -- format_on_save = {
    --   lsp_fallback = true,
    --   timeout_ms = 500,
    -- },
  },
  event = "VeryLazy",
}

M.config = function(_, opts)
  local conform = require("conform")
  require("conform").setup(opts)
  vim.keymap.set("n", "[Lsp]f", function()
    conform.format()
  end)
end

return M
