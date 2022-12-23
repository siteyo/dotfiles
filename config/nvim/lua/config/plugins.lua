return {
  ------------------------------------------------------------
  --- Library
  ------------------------------------------------------------
  "nvim-lua/plenary.nvim",
  "kyazdani42/nvim-web-devicons",

  ------------------------------------------------------------
  --- Colorscheme
  ------------------------------------------------------------
  "cocopon/iceberg.vim",

  ------------------------------------------------------------
  --- Filer
  ------------------------------------------------------------
  -- {
  --   "nvim-tree/nvim-tree.lua",
  --   dependencies = {
  --     "nvim-tree/nvim-web-devicons",
  --   },
  -- },

  ------------------------------------------------------------
  --- Edit
  ------------------------------------------------------------
  {
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
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
  },
  {
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  },
  "gpanders/editorconfig.nvim",
  "machakann/vim-highlightedyank",
  { "sbdchd/neoformat", cmd = "Neoformat" },

  ------------------------------------------------------------
  --- Completion
  ------------------------------------------------------------

  ------------------------------------------------------------
  --- LSP
  ------------------------------------------------------------
  {
    "williamboman/mason.nvim",
    config = function()
      require("mason").setup()
    end,
  },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end,
  },

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
      "rcarriga/nvim-notify",
    },
    config = function()
      require("noice").setup({
        messages = {
          enable = true,
          view = "mini",
        },
      })
    end,
  },
  {
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_current_context = true,
      })
    end,
  },

  ------------------------------------------------------------
  --- Git
  ------------------------------------------------------------
  {
    "TimUntersberger/neogit",
    cmd = "Neogit",
    config = function()
      require("neogit").setup({})
    end,
  },

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
    config = function()
      require("toggleterm").setup()
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
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
  {
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require("colorful-winsep").setup({})
    end,
  },
  { "ellisonleao/glow.nvim", cmd = "Glow" },
}
