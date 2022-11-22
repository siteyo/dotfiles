------------------------------------------------------------
--- Plugins
------------------------------------------------------------
return require("packer").startup(function(use)
  ------------------------------------------------------------
  --- Plugin Manager
  ------------------------------------------------------------
  --- Packer
  use({ "wbthomason/packer.nvim", opt = true })

  ------------------------------------------------------------
  --- Library
  ------------------------------------------------------------
  --- Lua library
  use({ "nvim-lua/plenary.nvim" })
  --- Icon
  use({ "kyazdani42/nvim-web-devicons" })

  ------------------------------------------------------------
  --- Colorscheme
  ------------------------------------------------------------
  local colorscheme = "iceberg"
  --- iceberg
  use({
    "cocopon/iceberg.vim",
    as = "iceberg",
    config = function()
      vim.cmd.colorscheme("iceberg")
    end,
  })
  --- catppuccin
  -- use({
  --   "catppuccin/nvim",
  --   as = "catppuccin",
  --   config = function()
  --     require("rc/plugins/catppuccin")
  --   end,
  -- })
  --- nightfox
  -- use({ "EdenEast/nightfox.nvim" })
  -- --- tokyonight
  -- use({ "folke/tokyonight.nvim" })

  ------------------------------------------------------------
  --- Filer
  ------------------------------------------------------------
  --- neo-tree
  -- use({
  --   'nvim-neo-tree/neo-tree.nvim',
  --   branch = 'v2.x',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'kyazdani42/nvim-web-devicons',
  --     'MunifTanjim/nui.nvim',
  --   },
  --   config = function()
  --     require('rc/plugins/neo-tree')
  --   end,
  -- })
  --- nvim-tree
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
    config = function()
      require("rc.plugins/nvim-tree")
    end,
  })

  ------------------------------------------------------------
  --- Edit
  ------------------------------------------------------------
  --- nvim-surround
  use({
    "kylechui/nvim-surround",
    config = function()
      require("rc/plugins/nvim-surround")
    end,
  })
  --- Comment
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("rc/plugins/Comment")
    end,
    after = "nvim-treesitter"
  })
  --- nvim-autopairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("rc/plugins/nvim-autopairs")
    end,
  })
  --- editorconfig.nvim
  use({ "gpanders/editorconfig.nvim" })
  --- vim-highlightedyank
  use({ "machakann/vim-highlightedyank" })
  --- neoformat
  use({ "sbdchd/neoformat" })

  ------------------------------------------------------------
  --- Completion
  ------------------------------------------------------------
  --- nvim-cmp
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("rc/plugins/nvim-cmp")
    end,
  })
  --- cmp-nvim-lsp
  use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
  --- cmp-buffer
  use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
  --- cmp-cmdline
  use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
  --- cmp-path
  use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
  --- cmp-cmdline-history
  use({ "dmitmel/cmp-cmdline-history", after = "nvim-cmp" })
  --- cmp-vsnip
  use({ "hrsh7th/cmp-vsnip", after = "nvim-cmp" })
  --- cmp-nvim-lua
  use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
  --- vim-vsnip
  use({ "hrsh7th/vim-vsnip" })

  ------------------------------------------------------------
  --- LSP
  ------------------------------------------------------------
  --- lspkind
  use({
    "onsails/lspkind-nvim",
  })
  --- lspconfig
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("rc/plugins/nvim-lspconfig")
    end,
  })
  --- mason
  use({
    "williamboman/mason.nvim",
    requires = { "neovim/nvim-lspconfig" },
    config = function()
      require("rc/plugins/mason")
    end,
  })
  --- mason-lspconfig
  use({
    "williamboman/mason-lspconfig.nvim",
    requirees = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    config = function()
      require("rc/plugins/mason-lspconfig")
    end,
    after = { "mason.nvim", "nvim-lspconfig", "cmp-nvim-lsp" },
  })
  --- lspsaga
  use({
    "glepnir/lspsaga.nvim",
    branch = "main",
    config = function()
      require("rc/plugins/lspsaga")
    end,
  })
  --- null-ls
  use({
    "jose-elias-alvarez/null-ls.nvim",
    after = "mason.nvim",
    config = function()
      require("rc/plugins/null-ls")
    end,
  })
  --- fidget
  use({
    "j-hui/fidget.nvim",
    config = function()
      require("rc/plugins/fidget")
    end,
  })
  --- trouble
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("rc/plugins/trouble")
    end,
  })

  ------------------------------------------------------------
  --- FuzzyFinder
  ------------------------------------------------------------
  --- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rc/plugins/telescope")
    end,
  })
  --- telescope-frecency (MRU)
  use({
    "nvim-telescope/telescope-frecency.nvim",
    requires = { "kkharji/sqlite.lua" },
    config = function()
      require("telescope").load_extension("frecency")
    end,
    after = { "telescope.nvim" },
  })
  --- telescope-file-browser
  use({
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("telescope").load_extension("file_browser")
    end,
    after = { "telescope.nvim" },
  })

  ------------------------------------------------------------
  --- Interface
  ------------------------------------------------------------
  --- noice
  -- use({
  --   "folke/noice.nvim",
  --   config = function()
  --     require("rc/plugins/noice")
  --   end,
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  -- })
  --- lualine
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("rc/plugins/lualine")
    end,
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    after = { colorscheme },
  })
  --- bufferline
  use({
    "akinsho/bufferline.nvim",
    config = function()
      require("rc/plugins/bufferline")
    end,
    tag = "v3.*",
    requires = "kyazdani42/nvim-web-devicons",
    after = { colorscheme },
  })
  --- indent-blankline
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("rc/plugins/indent-blankline")
    end,
  })

  ------------------------------------------------------------
  --- Git
  ------------------------------------------------------------
  --- fugitive
  use({
    "tpope/vim-fugitive",
    config = function()
      require("rc/plugins/fugitive")
    end,
  })
  --- gitsigns
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("rc/plugins/gitsigns")
    end,
  })
  --- git
  -- use({
  --   "dinhhuy258/git.nvim",
  --   config = function()
  --     require("git").setup()
  --   end,
  -- })

  ------------------------------------------------------------
  --- Language
  ------------------------------------------------------------
  --- nvim-treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("rc/plugins/treesitter")
    end,
    run = ":TSUpdate",
  })
  -- nvim-ts-context-commentstring
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter",
  })

  ------------------------------------------------------------
  --- Util
  ------------------------------------------------------------
  --- nvim-notify
  use({
    "rcarriga/nvim-notify",
    config = function()
      require("rc/plugins/notify")
    end,
    after = { "telescope.nvim" },
  })
  --- toggleterm.nvim
  use({
    "akinsho/toggleterm.nvim",
    config = function()
      require("rc/plugins/toggleterm")
    end,
  })
  --- diffview.nvim
  use({
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
  })
  --- hop.nvim
  use({
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("rc/plugins/hop")
    end,
  })
  -- colorizer
  use({
    "norcalli/nvim-colorizer.lua",
    config = function()
      require("rc/plugins/nvim-colorizer")
    end,
  })
  --- refactoring.nvim
  -- use({
  --   "ThePrimeagen/refactoring.nvim",
  --   requires = {
  --     { "nvim-lua/plenary.nvim" },
  --     { "nvim-treesitter/nvim-treesitter" },
  --   },
  --   config = function()
  --     require("refactoring").setup({})
  --   end,
  -- })
  --- colorful-winsep
  use({
    "nvim-zh/colorful-winsep.nvim",
    config = function()
      require("colorful-winsep").setup()
    end,
  })
end)
