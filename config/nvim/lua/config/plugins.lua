return {
  ------------------------------------------------------------
  --- Library
  ------------------------------------------------------------
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",
  "MunifTanjim/nui.nvim",

  ------------------------------------------------------------
  --- Colorscheme
  ------------------------------------------------------------
  "cocopon/iceberg.vim",

  ------------------------------------------------------------
  --- Filer
  ------------------------------------------------------------
  { "nvim-tree/nvim-tree.lua", enabled = false },

  ------------------------------------------------------------
  --- Edit
  ------------------------------------------------------------
  {
    "kylechui/nvim-surround",
    config = true,
    event = "InsertEnter",
  },
  {
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup({
        pre_hook = function()
          return require("ts_context_commentstring.internal").calculate_commentstring()
        end,
      })
    end,
    event = "BufReadPre",
  },
  { "windwp/nvim-autopairs", config = true, event = "BufReadPre" },
  { "gpanders/editorconfig.nvim", event = "BufReadPost" },
  { "machakann/vim-highlightedyank", event = "BufReadPost" },
  { "sbdchd/neoformat", cmd = "Neoformat" },

  ------------------------------------------------------------
  --- Completion
  ------------------------------------------------------------

  ------------------------------------------------------------
  --- LSP
  ------------------------------------------------------------
  { "williamboman/mason.nvim", config = true, cmd = "Mason" },
  { "j-hui/fidget.nvim", config = true, enabled = false },
  { "jayp0521/mason-null-ls.nvim", config = true, cmd = "NullLsInstall" },

  ------------------------------------------------------------
  --- FuzzyFinder
  ------------------------------------------------------------

  ------------------------------------------------------------
  --- Interface
  ------------------------------------------------------------
  {
    "folke/noice.nvim",
    dependencies = {
      "MunifTanjim/nui.nvim",
      -- "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        messages = {
          enable = true,
          view = "mini",
          view_error = "mini",
          view_warn = "mini",
        },
      })
    end,
    event = "VeryLazy",
  },
  { "stevearc/dressing.nvim", config = true, lazy = false },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_current_context = true,
      })
    end,
    event = "BufReadPost",
  },

  ------------------------------------------------------------
  --- Git
  ------------------------------------------------------------
  { "TimUntersberger/neogit", cmd = "Neogit", config = true },

  ------------------------------------------------------------
  --- Language
  ------------------------------------------------------------

  ------------------------------------------------------------
  --- Util
  ------------------------------------------------------------
  {
    "akinsho/toggleterm.nvim",
    enabled = false,
    cmd = "ToggleTerm",
    config = true,
  },
  { "sindrets/diffview.nvim" },
  {
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("colorizer").setup({
        "css",
        "javascript",
        "javascriptreact",
        "typescript",
        "typescriptreact",
        "html",
      })
    end,
  },
  { "nvim-zh/colorful-winsep.nvim", config = true, event = "BufAdd" },
  { "ellisonleao/glow.nvim", cmd = "Glow" },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
