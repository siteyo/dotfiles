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
    enabled = false,
  },

  -- lspconfig
  {
    "neovim/nvim-lspconfig",
    dependencies = {
      -- "williamboman/mason.nvim",
      -- "williamboman/mason-lspconfig.nvim",
      "hrsh7th/cmp-nvim-lsp",
      -- "jose-elias-alvarez/typescript.nvim",
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
        bashls = true,
        cssls = true,
        dockerls = true,
        emmet_ls = true,
        jsonls = true,
        -- marksman = true,
        -- pylsp = true,
        ruff = true,
        pyright = true,
        rust_analyzer = true,
        -- sqlls = true,
        sqls = true,
        ts_ls = true,
        lua_ls = {
          settings = {
            Lua = {
              workspace = {
                checkThirdParty = false,
              },
              completion = {
                callSnippet = "Replace",
              },
              -- diagnostics = {
              --   globals = { "vim" },
              -- },
            },
          },
        },
      },
      setup = {
        -- tsserver = function(_, opts)
        --   require("typescript").setup({ server = opts })
        --   return true
        -- end,
        ["*"] = function(_, _) end,
      },
    },
    config = function(_, opts)
      local servers = opts.servers
      local capabilities = vim.tbl_deep_extend(
        "force",
        {},
        vim.lsp.protocol.make_client_capabilities(),
        require("cmp_nvim_lsp").default_capabilities()
      )

      local function setup(server)
        local server_opts = servers[server] == true and {} or servers[server]
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

      -- local mlsp = require("mason-lspconfig")
      -- local available = mlsp.get_available_servers()

      -- local ensure_installed = {}
      for server, server_opts in pairs(servers) do
        if server_opts then
          server_opts = server_opts == true and {} or server_opts
          -- if server_opts.mason == false or not vim.tbl_contains(available, server) then
          setup(server)
          -- else
          --   ensure_installed[#ensure_installed + 1] = server
          -- end
        end
      end

      -- mlsp.setup({ ensure_installed = ensure_installed })
      -- mlsp.setup_handlers({ setup })
    end,
    enabled = enabled,
  },

  -- {
  --   "j-hui/fidget.nvim",
  --   event = "BufReadPre",
  --   config = true,
  -- },
}
