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
  use({
    'cocopon/iceberg.vim',
    -- config = 'vim.cmd[[colorscheme iceberg]]'
  })
  -- nvim-notify
  use({
    'rcarriga/nvim-notify',
    config = function()
      vim.notify = require('notify')
      require('telescope').load_extension('notify')
    end,
  })

  ------------------------------------------------------------
  --- Filer
  ------------------------------------------------------------
  -- neo-tree
  use({
    'nvim-neo-tree/neo-tree.nvim',
    branch = 'v2.x',
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
  -- editorconfig
  use({ 'gpanders/editorconfig.nvim' })

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
  use({ 'hrsh7th/cmp-nvim-lsp' })
  -- cmp-buffer
  use({ "hrsh7th/cmp-buffer", after = "nvim-cmp" })
  -- cmp-vsnip
  use({ 'hrsh7th/cmp-vsnip', after = "nvim-cmp" })
  -- vim-vsnip
  use({ 'hrsh7th/vim-vsnip' })

  ------------------------------------------------------------
  --- LSP
  ------------------------------------------------------------
  -- lspkind
	use({
		'onsails/lspkind-nvim',
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
  -- fidget
  use({
    "j-hui/fidget.nvim",
    config = function()
      require('fidget').setup({})
    end
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
    requires = {'kkharji/sqlite.lua'},
    config = function()
      require('telescope').load_extension('frecency')
    end,
  })

  ------------------------------------------------------------
  --- Interface
  ------------------------------------------------------------
  -- lualine
  use({
    'nvim-lualine/lualine.nvim',
    config = function ()
      require('rc/plugins/lualine')
    end,
    requires = { 'kyazdani42/nvim-web-devicons', opt = true }
  })
  -- bufferline
  use({
    'akinsho/bufferline.nvim',
    config = function ()
      require('rc/plugins/bufferline')
    end,
    tag = "v3.*",
    requires = 'kyazdani42/nvim-web-devicons'
  })
  -- indent-blankline
  use({
    "lukas-reineke/indent-blankline.nvim",
    config = function()
      require('indent_blankline').setup({
        show_current_context = true,
      })
    end,
  })

  ------------------------------------------------------------
  --- Git
  ------------------------------------------------------------
  -- neogit
  use({
    'TimUntersberger/neogit',
    requires = 'nvim-lua/plenary.nvim',
    config = function ()
      require('rc/plugins/neogit')
    end
  })
  -- gitsigns
  use({
    'lewis6991/gitsigns.nvim',
    config = function ()
      require('rc/plugins/gitsigns')
    end
  })

  ------------------------------------------------------------
  --- Language
  ------------------------------------------------------------
  -- nvim-treesitter
  use({
    'nvim-treesitter/nvim-treesitter',
    config = function ()
      require('rc/plugins/treesitter')
    end,
  })
  -- TODO: Formatter

  ------------------------------------------------------------
  --- Util
  ------------------------------------------------------------
  -- toggleterm
  use({
    "akinsho/toggleterm.nvim",
    config = function()
      require("toggleterm").setup()
    end
  })
  -- diffview
  use({
    'sindrets/diffview.nvim',
    requires = 'nvim-lua/plenary.nvim'
  })
  -- hop
  use({
    'phaazon/hop.nvim',
    branch = 'v2',
    config = function()
      require'hop'.setup { keys = 'etovxqpdygfblzhckisuran' }
      require('rc/plugins/hop')
    end
  })

end)

