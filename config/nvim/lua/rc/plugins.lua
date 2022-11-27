------------------------------------------------------------
--- Install Packer.nvim
------------------------------------------------------------
local packer_dir = vim.fn.stdpath("data") .. "/site/pack/packer/start/packer.nvim"
if vim.fn.empty(vim.fn.glob(packer_dir)) == 1 then
  vim.api.nvim_command("silent !git clone https://github.com/wbthomason/packer.nvim " .. packer_dir)
end

vim.cmd([[packadd packer.nvim]])

------------------------------------------------------------
--- Plugins
------------------------------------------------------------
return require("packer").startup(function(use)
  ------------------------------------------------------------
  --- Plugin Manager
  ------------------------------------------------------------
  use({ "wbthomason/packer.nvim", opt = true })

  ------------------------------------------------------------
  --- Library
  ------------------------------------------------------------
  use({ "nvim-lua/plenary.nvim" })
  use({ "kyazdani42/nvim-web-devicons" })

  ------------------------------------------------------------
  --- Colorscheme
  ------------------------------------------------------------
  local colorscheme = "iceberg"
  use({
    "cocopon/iceberg.vim",
    as = "iceberg",
    config = function()
      vim.cmd.colorscheme("iceberg")
    end,
  })
  -- use({
  --   "catppuccin/nvim",
  --   as = "catppuccin",
  -- })
  -- use({ "EdenEast/nightfox.nvim" })
  -- --- tokyonight
  -- use({ "folke/tokyonight.nvim" })

  ------------------------------------------------------------
  --- Filer
  ------------------------------------------------------------
  -- use({
  --   'nvim-neo-tree/neo-tree.nvim',
  --   branch = 'v2.x',
  --   requires = {
  --     'nvim-lua/plenary.nvim',
  --     'kyazdani42/nvim-web-devicons',
  --     'MunifTanjim/nui.nvim',
  --   },
  -- })
  use({
    "nvim-tree/nvim-tree.lua",
    requires = {
      "nvim-tree/nvim-web-devicons",
    },
  })

  ------------------------------------------------------------
  --- Edit
  ------------------------------------------------------------
  use({ "kylechui/nvim-surround" })
  use({ "numToStr/Comment.nvim", after = "nvim-treesitter" })
  use({ "windwp/nvim-autopairs" })
  use({ "gpanders/editorconfig.nvim" })
  use({ "machakann/vim-highlightedyank" })
  use({ "sbdchd/neoformat" })

  ------------------------------------------------------------
  --- Completion
  ------------------------------------------------------------
  use({ "hrsh7th/nvim-cmp" })
  use({ "hrsh7th/cmp-nvim-lsp", after = "nvim-cmp" })
  use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
  use({ "hrsh7th/cmp-cmdline", after = "nvim-cmp" })
  use({ "hrsh7th/cmp-path", after = "nvim-cmp" })
  use({ "dmitmel/cmp-cmdline-history", after = "nvim-cmp" })
  use({ "hrsh7th/cmp-vsnip", after = "nvim-cmp" })
  use({ "hrsh7th/cmp-nvim-lua", after = "nvim-cmp" })
  use({ "hrsh7th/vim-vsnip" })

  ------------------------------------------------------------
  --- LSP
  ------------------------------------------------------------
  use({ "onsails/lspkind-nvim" })
  use({ "neovim/nvim-lspconfig" })
  use({ "williamboman/mason.nvim", requires = "neovim/nvim-lspconfig" })
  use({
    "williamboman/mason-lspconfig.nvim",
    requirees = {
      "williamboman/mason.nvim",
      "neovim/nvim-lspconfig",
    },
    after = { "mason.nvim", "nvim-lspconfig", "cmp-nvim-lsp" },
  })
  use({ "glepnir/lspsaga.nvim", branch = "main" })
  use({ "jose-elias-alvarez/null-ls.nvim", after = "mason.nvim" })
  use({ "j-hui/fidget.nvim" })
  use({ "folke/trouble.nvim", requires = "kyazdani42/nvim-web-devicons" })

  ------------------------------------------------------------
  --- FuzzyFinder
  ------------------------------------------------------------
  use({
    "nvim-telescope/telescope.nvim",
    requires = "nvim-lua/plenary.nvim",
  })
  use({
    "nvim-telescope/telescope-frecency.nvim",
    requires = "kkharji/sqlite.lua",
    config = function()
      require("telescope").load_extension("frecency")
    end,
    after = "telescope.nvim",
  })
  use({
    "nvim-telescope/telescope-file-browser.nvim",
    config = function()
      require("telescope").load_extension("file_browser")
    end,
    after = "telescope.nvim",
  })

  ------------------------------------------------------------
  --- Interface
  ------------------------------------------------------------
  -- use({
  --   "folke/noice.nvim",
  --   requires = {
  --     "MunifTanjim/nui.nvim",
  --     "rcarriga/nvim-notify",
  --   },
  -- })
  use({
    "nvim-lualine/lualine.nvim",
    requires = { "kyazdani42/nvim-web-devicons", opt = true },
    after = { colorscheme },
  })
  use({
    "akinsho/bufferline.nvim",
    tag = "v3.*",
    requires = "kyazdani42/nvim-web-devicons",
    after = { colorscheme },
  })
  use({ "lukas-reineke/indent-blankline.nvim" })

  ------------------------------------------------------------
  --- Git
  ------------------------------------------------------------
  use({ "tpope/vim-fugitive" })
  use({ "lewis6991/gitsigns.nvim" })
  -- use({ "dinhhuy258/git.nvim" })

  ------------------------------------------------------------
  --- Language
  ------------------------------------------------------------
  use({ "nvim-treesitter/nvim-treesitter", run = ":TSUpdate" })
  use({
    "JoosepAlviste/nvim-ts-context-commentstring",
    after = "nvim-treesitter",
  })

  ------------------------------------------------------------
  --- Util
  ------------------------------------------------------------
  use({ "rcarriga/nvim-notify", after = "telescope.nvim" })
  use({ "akinsho/toggleterm.nvim" })
  use({ "sindrets/diffview.nvim", requires = "nvim-lua/plenary.nvim" })
  use({ "phaazon/hop.nvim", branch = "v2" })
  use({ "norcalli/nvim-colorizer.lua" })
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
  use({ "nvim-zh/colorful-winsep.nvim" })
end)
