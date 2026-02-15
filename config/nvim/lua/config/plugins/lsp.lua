local M = {
  {
    "neovim/nvim-lspconfig",
    dependencies = { "saghen/blink.cmp" },
    event = "VeryLazy",
    opts = {
      diagnostics = {
        underline = true,
        update_in_insert = false,
        virtual_text = { spacing = 4, source = "if_many", prefix = "●" },
        severity_sort = true,
      },
      servers = {
        bashls = true,
        cssls = true,
        dockerls = true,
        emmet_ls = true,
        jsonls = true,
        ruff = true,
        pyright = true,
        rust_analyzer = true,
        sqls = true,
        ts_ls = true,
        lua_ls = {
          settings = {
            Lua = {
              runtime = {
                version = "LuaJIT",
                path = vim.split(package.path, ";"),
              },
              workspace = {
                library = { vim.env.VIMRUNTIME },
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
      -- setup = {
      --   -- tsserver = function(_, opts)
      --   --   require("typescript").setup({ server = opts })
      --   --   return true
      --   -- end,
      --   ["*"] = function(_, _) end,
      -- },
    },
    config = function(_, opts)
      -- diagnostics
      vim.diagnostic.config(vim.deepcopy(opts.diagnostics))

      local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities())
      for server, config in pairs(opts.servers) do
        local server_opts = config == true and {} or config
        if server_opts then
          server_opts.capabilities =
            vim.tbl_deep_extend("force", capabilities, require("blink.cmp").get_lsp_capabilities({}, false))
          vim.lsp.config(server, server_opts)
          vim.lsp.enable(server)
        end
      end

      -- local servers = opts.servers
      -- local capabilities = vim.tbl_deep_extend("force", {}, vim.lsp.protocol.make_client_capabilities())
      --
      -- local function setup(server)
      --   local server_opts = servers[server] == true and {} or servers[server]
      --   server_opts.capabilities = capabilities
      --   if opts.setup[server] then
      --     if opts.setup[server](server, server_opts) then
      --       return
      --     end
      --   elseif opts.setup["*"] then
      --     if opts.setup["*"](server, server_opts) then
      --       return
      --     end
      --   end
      --   vim.lsp.config(server, server_opts)
      --   vim.lsp.enable(server)
      --   -- require("lspconfig")[server].setup(server_opts)
      -- end
      --
      -- for server, _ in pairs(servers) do
      --   setup(server)
      -- end
    end,
  },
}

return M
