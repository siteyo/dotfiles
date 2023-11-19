local M = {
  "mfussenegger/nvim-lint",
  event = "VeryLazy",
  config = function()
    require("lint").linters_by_ft = {
      typescript = { "eslint" },
      typescriptreact = { "eslint" },
      javascript = { "eslint" },
      javascriptreact = { "eslint" },
      python = { "flake8", "mypy" },
      yaml = { "actionlint" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
      callback = function()
        require("lint").try_lint()
      end,
    })
  end,
  -- enabled = false,
}

return M
