local M = {
  'stevearc/conform.nvim',
  opts = {
    formatters_by_ft = {
      lua = {"stylua"},
      python = {"black", "isort"},
      javascript = {"prettier"},
      javascriptreact = {"prettier"},
      typescript = {"prettier"},
      typescriptreact = {"prettier"}
    }
  },
  event = "VeryLazy"
}

M.config = function (_, opts)
  local conform = require("conform")
  require("conform").setup(opts)
  vim.keymap.set("n", "[Lsp]f", function ()
    conform.format()
  end)
end

return M
