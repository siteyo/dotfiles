return {
  ------------------------------------------------------------
  --- Library
  ------------------------------------------------------------
  { "nvim-lua/plenary.nvim" },
  { "kyazdani42/nvim-web-devicons" },
  { "MunifTanjim/nui.nvim" },

  ------------------------------------------------------------
  --- Colorscheme
  ------------------------------------------------------------
  { "cocopon/iceberg.vim" },

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
  { "windwp/nvim-autopairs", config = true, event = "BufReadPost" },
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

  ------------------------------------------------------------
  --- FuzzyFinder
  ------------------------------------------------------------

  ------------------------------------------------------------
  --- Interface
  ------------------------------------------------------------
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
  {
    "petertriho/nvim-scrollbar",
    config = function()
      local colors = require("tokyonight.colors").setup()
      require("scrollbar").setup({
        handle = {
          color = colors.bg_highlight,
        },
        excluded_filetypes = { "noice" },
        marks = {
          Search = { color = colors.orange },
          Error = { color = colors.error },
          Warn = { color = colors.warning },
          Info = { color = colors.info },
          Hint = { color = colors.hint },
          Misc = { color = colors.purple },
        },
      })
    end,
    event = "BufReadPost",
  },
  { "nvim-zh/colorful-winsep.nvim", config = true, event = "BufAdd" },

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
  { "ellisonleao/glow.nvim", cmd = "Glow" },
  {
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
  },
}
