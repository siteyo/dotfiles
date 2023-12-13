local M = {
  "stevearc/conform.nvim",
  opts = {
    formatters_by_ft = {
      css = { "prettier" },
      fish = { "fish_indent" },
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
    format_on_save = function(bufnr)
      if vim.g.disable_autoformat or vim.b[bufnr].disable_autoformat then
        return
      end
      return { lsp_fallback = true, timeout_ms = 500 }
    end,
  },
  event = { "BufWritePre" },
  cmd = { "ConformInfo" },
  keys = {
    {
      "<Leader>lf",
      function()
        require("conform").format({ async = true, lsp_fallback = true })
      end,
      mode = "",
      desc = "Format buffer",
    },
  },
  enabled = true,
}

M.config = function(_, opts)
  require("conform").setup(opts)

  vim.api.nvim_create_user_command("Format", function(args)
    local range = nil
    if args.count ~= -1 then
      local end_line = vim.api.nvim_buf_get_lines(0, args.line2 - 1, args.line2, true)[1]
      range = {
        start = { args.line1, 0 },
        ["end"] = { args.line2, end_line:len() },
      }
    end
    require("conform").format({ async = true, lsp_fallback = true, range = range })
  end, { range = true })
  vim.api.nvim_create_user_command("FormatDisable", function(args)
    if args.bang then
      ---@diagnostic disable-next-line: inject-field
      vim.b.disable_autoformat = true
    else
      vim.g.disable_autoformat = true
    end
  end, { desc = "Disable autoformat-on-save", bang = true })
  vim.api.nvim_create_user_command("FormatEnable", function()
    ---@diagnostic disable-next-line: inject-field
    vim.b.disable_autoformat = false
    vim.g.disable_autoformat = false
  end, { desc = "Re-enable autoformat-on-save" })
end

return M
