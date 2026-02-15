local M = {
  -- {
  --   "saghen/blink.compat",
  --   version = "2.*",
  --   opts = {},
  -- },
  {
    "saghen/blink.cmp",
    event = { "InsertEnter", "CmdlineEnter" },
    dependencies = {
      "rafamadriz/friendly-snippets",
      { "mikavilpas/blink-ripgrep.nvim", version = "*" },
      "moyiz/blink-emoji.nvim",
    },
    version = "1.*",
    opts = {
      keymap = {
        preset = "enter",
        -- ["<C-g>"] = {
        --   function()
        --     require("blink-cmp").show({ providers = { "ripgrep" } })
        --   end,
        -- },
      },
      sources = {
        default = { "lsp", "buffer", "snippets", "path", "ripgrep", "emoji" },
        per_filetype = {
          lua = { inherit_defaults = true, "lazydev" },
          sql = { "snippets", "dadbod", "buffer" },
        },
        providers = {
          lazydev = {
            name = "LazyDev",
            module = "lazydev.integrations.blink",
            score_offset = 100,
          },
          ripgrep = {
            module = "blink-ripgrep",
            name = "Ripgrep",
            opts = {},
            score_offset = -10,
          },
          dadbod = { name = "Dadbod", module = "vim_dadbod_completion.blink" },
          emoji = {
            module = "blink-emoji",
            name = "Emoji",
            score_offset = 15,
            opts = {
              insert = true,
              trigger = function()
                return { ":" }
              end,
            },
            should_show_items = function()
              return vim.tbl_contains({ "gitcommit", "markdown" }, vim.o.filetype)
            end,
          },
        },
      },
      cmdline = { enabled = false },
      completion = {
        documentation = {
          auto_show = true,
          auto_show_delay_ms = 500,
        },
        ghost_text = {
          enabled = true,
        },
        menu = {
          draw = {
            columns = {
              { "kind_icon" },
              { "label", "label_description", gap = 1 },
              { "kind" },
            },
            treesitter = { "lsp" },
          },
        },
      },
      fuzzy = { implementation = "prefer_rust_with_warning" },
      signature = { enabled = true },
    },
  },
}

return M
