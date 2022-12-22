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
  "EdenEast/nightfox.nvim",
  "folke/tokyonight.nvim",

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
  "sbdchd/neoformat",

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
    end
  },
  -- {
  --   "williamboman/mason-lspconfig.nvim",
  --   dependencies = {
  --     "williamboman/mason.nvim",
  --     "neovim/nvim-lspconfig",
  --     "hrsh7th/cmp-nvim-lsp",
  --   },
  -- },
  -- { "glepnir/lspsaga.nvim", branch = "main" },
  -- {
  --   "jose-elias-alvarez/null-ls.nvim",
  --   dependencies = { "williamboman/mason.nvim" },
  -- },
  {
    "j-hui/fidget.nvim",
    config = function()
      require("fidget").setup({})
    end,
  },
  -- {
  --   "folke/trouble.nvim",
  --   dependencies = { "kyazdani42/nvim-web-devicons" },
  -- },

  ------------------------------------------------------------
  --- FuzzyFinder
  ------------------------------------------------------------
  -- {
  --   "nvim-telescope/telescope.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-telescope/telescope-frecency.nvim",
  --     "kkharji/sqlite.lua",
  --     "nvim-telescope/telescope-file-browser.nvim",
  --   },
  -- },

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
  -- {
  --   "nvim-lualine/lualine.nvim",
  --   dependencies = { "kyazdani42/nvim-web-devicons" },
  -- },
  -- {
  --   "akinsho/bufferline.nvim",
  --   -- tag = "v3.*",
  --   dependencies = { "kyazdani42/nvim-web-devicons" },
  -- },
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
  -- { "tpope/vim-fugitive" },
  -- { "lewis6991/gitsigns.nvim" },

  ------------------------------------------------------------
  --- Language
  ------------------------------------------------------------
  -- {
  --   "nvim-treesitter/nvim-treesitter",
  --   build = ":TSUpdate",
  --   dependencies = {
  --     "JoosepAlviste/nvim-ts-context-commentstring",
  --     "nvim-treesitter/playground",
  --     "windwp/nvim-ts-autotag",
  --   },
  -- },

  ------------------------------------------------------------
  --- Util
  ------------------------------------------------------------
  -- { "rcarriga/nvim-notify", dependencies = "nvim-telescope/telescope.nvim" },
  {
    "akinsho/toggleterm.nvim",
    enabled = false,
    config = function()
      require("toggleterm").setup()
    end,
  },
  {
    "sindrets/diffview.nvim",
    dependencies = { "nvim-lua/plenary.nvim" },
  },
  -- { "phaazon/hop.nvim", branch = "v2" },
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
  -- {
  --   "ThePrimeagen/refactoring.nvim",
  --   dependencies = {
  --     "nvim-lua/plenary.nvim",
  --     "nvim-treesitter/nvim-treesitter",
  --   },
  --   config = function()
  --     require("refactoring").setup({})
  --   end,
  -- },
  {
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require("colorful-winsep").setup({})
    end,
  },
  "ellisonleao/glow.nvim",
}
