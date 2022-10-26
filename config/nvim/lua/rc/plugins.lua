return require('packer').startup(function(use)
  ------------------------------------------------------------
  --- Plugin Manager
  ------------------------------------------------------------
  --Packer
  use({ 'wbthomason/packer.nvim', opt = true })

  ------------------------------------------------------------
  --- Library
  ------------------------------------------------------------
  -- Lua library
  use({ 'nvim-lua/plenary.nvim' })
  -- Icon
  use({ 'kyazdani42/nvim-web-devicons' })
  -- Colorscheme
  use({
    'EdenEast/nightfox.nvim',
    config = 'vim.cmd[[colorscheme nightfox]]',
  })
  -- nvim-notify
  use({
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
    end,
  })

  ------------------------------------------------------------
  --- Filer
  ------------------------------------------------------------
  -- neo-tree
  use({
    'nvim-neo-tree/neo-tree.nvim',
    requires = {
      'nvim-lua/plenary.nvim',
      'kyazdani42/nvim-web-devicons',
      'MunifTanjim/nui.nvim',
    },
    config = function()
      require('rc/plugins/neo-tree')
    end,
  })

  ------------------------------------------------------------
  --- Edit
  ------------------------------------------------------------
  -- nvim-surround
  use({
    'kylechui/nvim-surround',
    config = function()
      require('nvim-surround').setup({})
    end
  })
  -- Comment
  use({
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end,
  })
  -- nvim-autopairs
  use({
    'windwp/nvim-autopairs',
    config = function()
      require('nvim-autopairs').setup({})
    end,
  })
  ------------------------------------------------------------
  --- Completion
  ------------------------------------------------------------
  -- nvim-cmp
  use({
    'hrsh7th/nvim-cmp',
    config = function()
      require('rc/plugins/nvim-cmp')
    end,
  })

  -- cmp-nvim-lsp
  use({ 'hrsh7th/cmp-nvim-lsp', module = 'cmp_nvim_lsp' })
  use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
  use({ 'hrsh7th/cmp-vsnip', after = "nvim-cmp" })
  use({ 'hrsh7th/vim-vsnip' })

  ------------------------------------------------------------
  --- LSP
  ------------------------------------------------------------
  -- lspkind
	use({
		'onsails/lspkind-nvim',
		module = 'lspkind',
	})
  -- lspconfig
  use({ 'neovim/nvim-lspconfig', })
  -- mason
  use({
    'williamboman/mason.nvim',
    requires = {'neovim/nvim-lspconfig'},
    config = function()
      require('mason').setup()
    end,
  })
  -- mason-lspconfig
  use({
    'williamboman/mason-lspconfig.nvim',
    requirees = {
      'williamboman/mason.nvim',
      'neovim/nvim-lspconfig',
    },
    config = function()
      require('rc/plugins/mason-lspconfig')
    end,
  })

  ------------------------------------------------------------
  --- FuzzyFinder
  ------------------------------------------------------------
  -- Telescope
  use({
    'nvim-telescope/telescope.nvim',
    requires = {'nvim-lua/plenary.nvim'},
    config = function()
      require('rc/plugins/telescope')
    end,
  })
  -- telescope-frecency (MRU)
  use({
    'nvim-telescope/telescope-frecency.nvim',
    config = function()
      require('telescope').load_extension('frecency')
    end,
    requires = {'kkharji/sqlite.lua'}
  })

  ------------------------------------------------------------
  --- Interface
  ------------------------------------------------------------
  -- lualine
  use({
    'nvim-lualine/lualine.nvim',
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  })

  ------------------------------------------------------------
  --- Git
  ------------------------------------------------------------
  -- neogit
  use({
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function ()
      require('neogit').setup()
    end
  })
  -- gitsigns
  use({
    'lewis6991/gitsigns.nvim',
    config = function ()
      require('gitsigns').setup()
    end
  })

  ------------------------------------------------------------
  --- Language
  ------------------------------------------------------------
  -- nvim-treesitter
  use({ 'nvim-treesitter/nvim-treesitter' })
  -- TODO: Formatter

  ------------------------------------------------------------
  --- Util
  ------------------------------------------------------------

end)

