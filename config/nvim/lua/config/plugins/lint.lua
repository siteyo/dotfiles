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
      -- yaml = { "actionlint", "yamllint" },
    }
    vim.api.nvim_create_autocmd({ "BufWritePost", "BufReadPost" }, {
      callback = function()
        -- yaml
        local yaml = { "yamllint" }
        if vim.bo.filetype == "yaml" then
          local filepath = vim.api.nvim_buf_get_name(0)
          if filepath:find("%.github[\\/]workflows") ~= nil then
            table.insert(yaml, "actionlint")
          end
        end
        require("lint").linters_by_ft["yaml"] = yaml
        -- other
        require("lint").try_lint()
      end,
    })
  end,
  enabled = true,
}

return M
