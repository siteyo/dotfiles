local enabled = true

return {
  -- mason
  {
    "williamboman/mason.nvim",
    cmd = "Mason",
    opts = {
      ensure_installed = {
        -- "editorconfig-checker",
        -- "markdownlint",
        -- "prettierd",
        -- "selene",
        "shellcheck",
        "shfmt",
        "stylua",
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
    enabled = enabled,
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      "jose-elias-alvarez/typescript.nvim",
    },
    event = "BufReadPre",
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, prefix = "●" },
        severity_sort = true,
      },
      servers = {
        bashls = {},
        docker_compose_language_service = {},
        dockerls = {},
        emmet_ls = {},
        jsonls = {},
        marksman = {},
        pylsp = {},
        sqlls = {},
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
              diagnostics = {
                globals = { "vim" },
              },
            },
          },
        },
      },
      setup = {
        tsserver = function(_, opts)
          require("typescript").setup({ server = opts })
          return true
        end,
        ["*"] = function(_, _)
        end,
      },
    },
    config = function(_, opts)
      local servers = opts.servers
      local capabilities = require("cmp_nvim_lsp").default_capabilities(vim.lsp.protocol.make_client_capabilities())

      local function setup(server)
        local server_opts = servers[server] or {}
        server_opts.capabilities = capabilities
        if opts.setup[server] then
          if opts.setup[server](server, server_opts) then
            return
          end
        elseif opts.setup["*"] then
          if opts.setup["*"](server, server_opts) then
            return
          end
        end
        require("lspconfig")[server].setup(server_opts)
      end

      local mlsp = require("mason-lspconfig")
      local available = mlsp.get_available_servers()

      local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          if server_opts.mason == false or not vim.tbl_contains(available, server) then
            setup(server)
          else
            ensure_installed[#ensure_installed + 1] = server
          end
        end
      end

      mlsp.setup({ ensure_installed = ensure_installed })
      mlsp.setup_handlers({ setup })
    end,
    enabled = enabled,
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
          -- nls.builtins.code_actions.refactoring,
          nls.builtins.code_actions.eslint,
          -- nls.builtins.code_actions.gitsigns,
          -- nls.builtins.code_actions.shellcheck,

          --- formatting
          nls.builtins.formatting.stylua.with({
            condition = function()
              return vim.fn.executable("stylua") > 0
            end,
          }),
          nls.builtins.formatting.shfmt.with({
            condition = function()
              return vim.fn.executable("shfmt") > 0
            end,
          }),
          nls.builtins.formatting.prettier.with({
            only_local = "node_modules/.bin",
            -- disabled_filetypes = { "markdown" },
          }),
          -- nls.builtins.formatting.prettierd.with({
          --   condition = function()
          --     return vim.fn.executable("prettierd") > 0
          --   end,
          --   filetypes = { "markdown" },
          -- }),

          --- diagnostics
          -- nls.builtins.diagnostics.editorconfig_checker.with({
          --   condition = function()
          --     return vim.fn.executable("ec") > 0
          --   end,
          -- }),
          nls.builtins.diagnostics.zsh,
          nls.builtins.diagnostics.shellcheck.with({
            condition = function()
              return vim.fn.executable("shellcheck") > 0
            end,
          }),
          nls.builtins.diagnostics.eslint.with({
            only_local = "node_modules/.bin",
          }),
          -- nls.builtins.diagnostics.tsc.with({
          --   only_local = "node_modules/.bin",
          -- }),
          nls.builtins.diagnostics.textlint.with({
            condition = function()
              return vim.fn.executable("node_modules/.bin/textlint") > 0
            end,
            only_local = "node_modules/.bin",
            timeout = 30000,
            filetypes = { "markdown" },
            args = { "-f", "json", "--cache", "$DIRNAME" },
            method = nls.methods.DIAGNOSTICS_ON_SAVE,
          }),
          nls.builtins.diagnostics.markdownlint.with({
            condition = function()
              return vim.fn.executable("markdownlint") > 0
            end,
            method = nls.methods.DIAGNOSTICS_ON_SAVE,
          }),
          nls.builtins.diagnostics.markdownlint_cli2.with({
            condition = function()
              return vim.fn.executable("node_modules/.bin/markdownlint-cli2") > 0
            end,
            only_local = "node_modules/.bin",
            args = { "**/*.md", "#node_modules" },
          }),
          nls.builtins.diagnostics.selene.with({
            condition = function()
              return vim.fn.executable("selene") > 0
            end,
          }),
        },
      }
    end,
    enabled = enabled,
  },
  -- {
  --   "j-hui/fidget.nvim",
  --   event = "BufReadPre",
  --   config = true,
  -- },
}
