return {
  -- mason
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        "stylua",
        "shellcheck",
        "shfmt",
        "prettierd",
        "luacheck",
        "eslint_d",
        "selene",
        "black",
        "isort",
        "flake8",
      },
    },
    config = function(_, opts)
      require("mason").setup(opts)
      local mr = require("mason-registry")
      for _, tool in ipairs(opts.ensure_installed) do
        local p = mr.get_package(tool)
        if not p:is_installed() then
          p:install()
        end
      end
    end,
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      -- "jose-elias-alvarez/typescript.nvim"
    },
    event = "BufReadPre",
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
      autoformat = true,
      -- servers = {
      --   jsonls = {},
      --   sumneko_lua = {
      --     settings = {
      --       Lua = {
      --         workspace = {
      --           checkThirdParty = false,
      --         },
      --         completion = {
      --           callSnippet = "Replace",
      --         },
      --         -- diagnostics = {
      --         --   globals = { "vim" },
      --         -- },
      --       },
      --     },
      --   },
      -- },
      -- setup = {
      -- tsserver = function(_, opts)
      --   require("typescript").setup({ server = opts })
      --   return true
      -- end,
      -- },
    },
    config = function(plugin, opts)
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
    end,
  },

  -- null-ls
  {
    "jose-elias-alvarez/null-ls.nvim",
    dependencies = { "williamboman/mason.nvim" },
    event = "BufReadPre",
    opts = function()
      local opts = { noremap = true, silent = true }
      vim.keymap.set("n", "[Lsp]f", function()
        vim.lsp.buf.format({ async = true })
      end, opts)

      local nls = require("null-ls")
      return {
        sources = {
          --- code action
          -- null_ls.builtins.code_actions.refactoring,
          --- formatting
          nls.builtins.formatting.stylua,
          nls.builtins.formatting.prettier,
          nls.builtins.formatting.shfmt,
          --- diagnostics
          nls.builtins.diagnostics.zsh,
          --- completion
          nls.builtins.completion.spell,
        },
      }
    end,
  },
}