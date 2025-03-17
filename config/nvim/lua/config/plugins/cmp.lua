local M = {
  "hrsh7th/nvim-cmp",
  event = { "InsertEnter", "CmdlineEnter" },
  dependencies = {
    "onsails/lspkind-nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    "dmitmel/cmp-cmdline-history",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rafamadriz/friendly-snippets",
    "uga-rosa/cmp-skkeleton",
    "hrsh7th/cmp-calc",
    -- "f3fora/cmp-spell",
    "lukas-reineke/cmp-rg",
    "ray-x/cmp-treesitter",
    "kristijanhusak/vim-dadbod-completion",
  },
}

function M.config()
  vim.opt.completeopt = "menu,menuone,noselect"

  local cmp = require("cmp")
  local luasnip = require("luasnip")
  luasnip.config.setup({
    history = true,
    enable_autosnippets = true,
  })

  cmp.setup({
    completion = {
      completeopt = "menu,menuone,noselect",
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
      end,
    },
    mapping = {
      ["<C-n>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "i", "c" }),
      ["<C-p>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "i", "c" }),
      ["<C-e>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.abort()
        else
          fallback()
        end
      end, { "i", "c" }),
      ["<C-y>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.complete()
        else
          fallback()
        end
      end, { "i", "c" }),
      ["<C-u>"] = cmp.mapping(cmp.mapping.scroll_docs(-4), { "i", "c" }),
      ["<C-d>"] = cmp.mapping(cmp.mapping.scroll_docs(4), { "i", "c" }),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
      ["<C-k>"] = cmp.mapping(function(fallback)
        if luasnip.expand_or_jumpable() then
          luasnip.expand_or_jump()
        else
          fallback()
        end
      end, { "i", "s" }),

      ["<C-i>"] = cmp.mapping(function(fallback)
        if luasnip.jumpable(-1) then
          luasnip.jump(-1)
        else
          fallback()
        end
      end, { "i", "s" }),
    },
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      { name = "nvim_lua" },
      { name = "path" },
      { name = "orgmode" },
      { name = "skkeleton", max_item_count = 10 },
      { name = "emoji", max_item_count = 5 },
      { name = "lazydev", keyword_length = 4 },
    }, {
      { name = "buffer", keyword_length = 4 },
      { name = "calc" },
      { name = "treesitter" },
      { name = "rg", keyword_length = 4 },
      { name = "vim-dadbod-completion" },
      { name = "neorg" },
      -- {
      --   name = "spell",
      --   entry_filter = function(entry, _)
      --     return string.match(entry:get_word(), "^%w+$")
      --   end,
      -- },
    }),
    -- view = {
    --   entries = "native",
    -- },
    formatting = {
      format = require("lspkind").cmp_format({
        mode = "symbol",
        maxwidth = 50,
        ellipsis_char = "...",
        menu = {
          buffer = "[Buffer]",
          nvim_lsp = "[LSP]",
          luasnip = "[LuaSnip]",
          nvim_lua = "[NeovimLua]",
          path = "[Path]",
          -- spell = "[Spell]",
          emoji = "[Emoji]",
          calc = "[Calc]",
          rg = "[Rg]",
          treesitter = "[TS]",
          cmdline = "[Cmd]",
          cmdline_history = "[History]",
        },
      }),
    },
    experimental = {
      ghost_text = true,
    },
    window = {
      completion = cmp.config.window.bordered(),
      documentation = cmp.config.window.bordered(),
    },
  })
  require("luasnip.loaders.from_vscode").lazy_load()

  cmp.setup.cmdline({ "/", "?" }, {
    mapping = {
      ["<C-n>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_next_item()
        else
          fallback()
        end
      end, { "c" }),
      ["<C-p>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.select_prev_item()
        else
          fallback()
        end
      end, { "c" }),
      ["<C-e>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.abort()
        else
          fallback()
        end
      end, { "c" }),
      ["<C-y>"] = cmp.mapping(function(fallback)
        if cmp.visible() then
          cmp.complete()
        else
          fallback()
        end
      end, { "c" }),
    },
    source = {
      { name = "buffer" },
    },
  })

  cmp.setup.cmdline(":", {
    -- mapping = cmp.mapping.preset.cmdline(),
    mapping = {
      ["<C-n>"] = {
        c = function(fallback)
          if cmp.visible() then
            cmp.select_next_item()
          else
            fallback()
          end
        end,
      },
      ["<C-p>"] = {
        c = function(fallback)
          if cmp.visible() then
            cmp.select_prev_item()
          else
            fallback()
          end
        end,
      },
      ["<C-e>"] = {
        c = cmp.mapping.abort(),
      },
      ["<Tab>"] = {
        c = cmp.mapping.confirm({ select = true }),
      },
    },
    sources = cmp.config.sources({
      { name = "path" },
      { name = "emoji", max_item_count = 5 },
    }, {
      { name = "cmdline", max_item_count = 10 },
    }, {
      { name = "cmdline_history", max_item_count = 5 },
    }),
  })
end

return M
