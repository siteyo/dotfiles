require("mason-lspconfig").setup()

-- local opts = { noremap = true, silent = true }
-- vim.keymap.set("n", "[w", vim.diagnostic.goto_prev, opts)
-- vim.keymap.set("n", "]w", vim.diagnostic.goto_next, opts)
-- vim.keymap.set("n", "[Lsp]d", vim.diagnostic.open_float, opts)
-- vim.keymap.set("n", "gD", vim.lsp.buf.declaration, opts)
-- vim.keymap.set("n", "gd", vim.lsp.buf.definition, opts)
-- vim.keymap.set("n", "K", vim.lsp.buf.hover, opts)
-- vim.keymap.set("n", "gi", vim.lsp.buf.implementation, opts)
-- vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, opts)
-- vim.keymap.set("n", "gr", vim.lsp.buf.references, opts)
-- vim.keymap.set("n", "gn", vim.lsp.buf.rename, opts)
-- vim.keymap.set('n', '[Lsp]a', vim.lsp.buf.code_action, opts)

-- local on_attach = function(_, bufnr)
--   local bufopts = { noremap = true, silent = true, buffer = bufnr }
--   vim.keymap.set("n", "gD", vim.lsp.buf.declaration, bufopts)
--   vim.keymap.set("n", "gd", vim.lsp.buf.definition, bufopts)
--   vim.keymap.set("n", "K", vim.lsp.buf.hover, bufopts)
--   vim.keymap.set("n", "gi", vim.lsp.buf.implementation, bufopts)
--   vim.keymap.set("n", "<C-k>", vim.lsp.buf.signature_help, bufopts)
--   vim.keymap.set("n", "gr", vim.lsp.buf.references, bufopts)
--   vim.keymap.set("n", "gn", vim.lsp.buf.rename, bufopts)
-- end

local lspconfig = require("lspconfig")
local capabilities = require("cmp_nvim_lsp").default_capabilities()

require("mason-lspconfig").setup_handlers({
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
