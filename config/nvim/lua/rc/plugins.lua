------------------------------------------------------------
--- Install packer.nvim
------------------------------------------------------------
local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({ "git", "clone", "--depth", "1", "https://github.com/wbthomason/packer.nvim", install_path })
    vim.cmd([[packadd packer.nvim]])
    return true
  end
  return false
end

local packer_bootstrap = ensure_packer()

------------------------------------------------------------
--- Plugins
------------------------------------------------------------
return require("packer").startup(function(use)
  ------------------------------------------------------------
  --- Plugin Manager
  ------------------------------------------------------------
  --Packer
  use({ "wbthomason/packer.nvim", opt = true })

  ------------------------------------------------------------
  --- Library
  ------------------------------------------------------------
  -- Lua library
  use({ "nvim-lua/plenary.nvim" })
  -- Icon
  use({ "kyazdani42/nvim-web-devicons" })
  -- Colorscheme
  use({
    "EdenEast/nightfox.nvim",
    config = "vim.cmd[[colorscheme nightfox]]",
  })
  use({
    "cocopon/iceberg.vim",
    -- config = 'vim.cmd[[colorscheme iceberg]]'
  })
  -- nvim-notify
  use({
    "rcarriga/nvim-notify",
    config = function()
      vim.notify = require("notify")
      require("telescope").load_extension("notify")
      require("notify").setup({
        background_colour = "#000000",
      })
    end,
  })

  ------------------------------------------------------------
  --- Filer
  ------------------------------------------------------------
  -- neo-tree
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
  -- nvim-tree
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons", -- optional, for file icons
    },
    config = function()
      require("rc.plugins/nvim-tree")
    end,
  })

  ------------------------------------------------------------
  --- Edit
  ------------------------------------------------------------
  -- nvim-surround
  use({
    "kylechui/nvim-surround",
    config = function()
      require("nvim-surround").setup({})
    end,
  })
  -- Comment
  use({
    "numToStr/Comment.nvim",
    config = function()
      require("Comment").setup()
    end,
  })
  -- nvim-autopairs
  use({
    "windwp/nvim-autopairs",
    config = function()
      require("nvim-autopairs").setup({})
    end,
  })
  -- editorconfig
  use({ "gpanders/editorconfig.nvim" })

  ------------------------------------------------------------
  --- Completion
  ------------------------------------------------------------
  -- nvim-cmp
  use({
    "hrsh7th/nvim-cmp",
    config = function()
      require("rc/plugins/nvim-cmp")
    end,
  })
  -- cmp-nvim-lsp
  use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
  -- cmp-buffer
  use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
  -- cmp-cmdline
  use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
  -- cmp-path
  use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
  -- cmp-cmdline-history
  use({ "dmitmel/cmp-cmdline-history", after = "nvim-cmp" })
  -- cmp-vsnip
  use({ "hrsh7th/cmp-vsnip", after = "nvim-cmp" })
  -- cmp-nvim-lua
  use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
  -- vim-vsnip
  use({ "hrsh7th/vim-vsnip" })

  ------------------------------------------------------------
  --- LSP
  ------------------------------------------------------------
  -- lspkind
  use({
    "onsails/lspkind-nvim",
  })
  -- lspconfig
  use({
    "neovim/nvim-lspconfig",
    config = function()
      require("rc/plugins/nvim-lspconfig")
    end,
  })
  -- mason
  use({
    "williamboman/mason.nvim",
    requires = { "neovim/nvim-lspconfig" },
    config = function()
      require("mason").setup()
    end,
  })
  -- mason-lspconfig
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
  -- null-ls
  use({
    "jose-elias-alvarez/null-ls.nvim",
    after = "mason.nvim",
    config = function()
      require("rc/plugins/null-ls")
    end,
  })
  -- fidget
  -- use({
  --   "j-hui/fidget.nvim",
  --   config = function()
  --     require("fidget").setup({})
  --   end,
  -- })
  -- trouble
  use({
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require("trouble").setup({
        -- your configuration comes here
        -- or leave it empty to use the default settings
        -- refer to the configuration section below
      })
    end,
  })

  ------------------------------------------------------------
  --- FuzzyFinder
  ------------------------------------------------------------
  -- Telescope
  use({
    "nvim-telescope/telescope.nvim",
    requires = { "nvim-lua/plenary.nvim" },
    config = function()
      require("rc/plugins/telescope")
    end,
  })
  -- telescope-frecency (MRU)
  use({
    "nvim-telescope/telescope-frecency.nvim",
    requires = { "kkharji/sqlite.lua" },
    config = function()
      require("telescope").load_extension("frecency")
    end,
  })

  ------------------------------------------------------------
  --- Interface
  ------------------------------------------------------------
  -- noice
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
  -- lualine
  use({
    "nvim-lualine/lualine.nvim",
    config = function()
      require("rc/plugins/lualine")
    end,
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
  })
  -- bufferline
  use({
    "akinsho/bufferline.nvim",
    config = function()
      require("rc/plugins/bufferline")
    end,
    tag = "v3.*",
    requires = "kyazdani42/nvim-web-devicons",
  })
  -- indent-blankline
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require("indent_blankline").setup({
        show_current_context = true,
      })
    end,
  })

  ------------------------------------------------------------
  --- Git
  ------------------------------------------------------------
  -- neogit
  use({
    "TimUntersberger/neogit",
    requires = "nvim-lua/plenary.nvim",
    config = function()
      require("rc/plugins/neogit")
    end,
  })
  -- gitsigns
  use({
    "lewis6991/gitsigns.nvim",
    config = function()
      require("rc/plugins/gitsigns")
    end,
  })

  ------------------------------------------------------------
  --- Language
  ------------------------------------------------------------
  -- nvim-treesitter
  use({
    "nvim-treesitter/nvim-treesitter",
    config = function()
      require("rc/plugins/treesitter")
    end,
  })

  ------------------------------------------------------------
  --- Util
  ------------------------------------------------------------
  -- toggleterm
  use({
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup()
    end,
  })
  -- diffview
  use({
    "sindrets/diffview.nvim",
    requires = "nvim-lua/plenary.nvim",
  })
  -- hop
  use({
    "phaazon/hop.nvim",
    branch = "v2",
    config = function()
      require("rc/plugins/hop")
    end,
  })

  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require("packer").sync()
  end
end)
