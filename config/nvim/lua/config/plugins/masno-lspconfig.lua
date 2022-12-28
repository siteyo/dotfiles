local M = {
  "williamboman/mason-lspconfig.nvim",
  dependencies = {
    "williamboman/mason.nvim",
    "neovim/nvim-lspconfig",
    "hrsh7th/cmp-nvim-lsp",
  },
  lazy = false,
}

function M.config()
  local mason_lspconfig = require("mason-lspconfig")
  local lspconfig = require("lspconfig")
  local capabilities = require("cmp_nvim_lsp").default_capabilities()
  mason_lspconfig.setup()
  mason_lspconfig.setup_handlers({
    function(server_name) -- default handler (optional)
      lspconfig[server_name].setup({
        -- on_attach = on_attach,
        capabilities = capabilities,
      })
    end,
    ["sumneko_lua"] = function()
      lspconfig.sumneko_lua.setup({
        settings = {
          Lua = {
            diagnostics = {
              globals = { "vim" },
            },
          },
        },
      })
    end,
  })
end

return M
