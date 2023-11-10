local M = {
  "hrsh7th/nvim-cmp",
  event = "InsertEnter",
  dependencies = {
    "onsails/lspkind-nvim",
    "hrsh7th/cmp-nvim-lsp",
    "hrsh7th/cmp-buffer",
    "hrsh7th/cmp-cmdline",
    "hrsh7th/cmp-path",
    "hrsh7th/cmp-emoji",
    "dmitmel/cmp-cmdline-history",
    -- "hrsh7th/cmp-vsnip",
    -- "hrsh7th/vim-vsnip",
    "hrsh7th/cmp-nvim-lua",
    "saadparwaiz1/cmp_luasnip",
    "L3MON4D3/LuaSnip",
    "rinx/cmp-skkeleton",
    "hrsh7th/cmp-calc",
  },
}

function M.config()
  vim.opt.completeopt = "menu,menuone,noselect"

  local cmp = require("cmp")

  cmp.setup({
    completion = {
      completeopt = "menu,menuone,noselect",
    },
    snippet = {
      expand = function(args)
        require("luasnip").lsp_expand(args.body)
        -- vim.fn["vsnip#anonymous"](args.body)
      end,
    },
    mapping = cmp.mapping.preset.insert({
      ["<C-b>"] = cmp.mapping.scroll_docs(-4),
      ["<C-f>"] = cmp.mapping.scroll_docs(4),
      ["<C-y>"] = cmp.mapping.complete(),
      ["<C-e>"] = cmp.mapping.abort(),
      ["<CR>"] = cmp.mapping.confirm({ select = true }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
    }),
    sources = cmp.config.sources({
      { name = "nvim_lsp" },
      { name = "luasnip" },
      -- { name = "vsnip" },
      { name = "nvim_lua" },
      { name = "buffer" },
      { name = "path" },
      { name = "emoji", max_item_count = 10 },
      { name = "neorg" },
      { name = "orgmode" },
      { name = "skkeleton", max_item_count = 10 },
      { name = "calc" },
    }),
    formatting = {
      format = require("lspkind").cmp_format({
        mode = "symbol",
        maxwidth = 50,
        ellipsis_char = "...",
      }),
    },
    experimental = {
      ghost_text = true,
    },
  })

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
      { name = "cmdline", max_item_count = 10 },
      { name = "cmdline_history", max_item_count = 5 },
    },
  })
end

return M
