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
    event = "BufReadPost",
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
  { "uga-rosa/ccc.nvim", config = true, cmd = "CccPick" },

  ------------------------------------------------------------
  --- Interface
  ------------------------------------------------------------
  { "stevearc/dressing.nvim", config = true, lazy = "VeryLazy" },
  { "nvim-zh/colorful-winsep.nvim", config = true, event = "BufAdd" },

  ------------------------------------------------------------
  --- Util
  ------------------------------------------------------------
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
    "iamcco/markdown-preview.nvim",
    build = function()
      vim.fn["mkdp#util#install"]()
    end,
    ft = "markdown",
  },
  -- { "folke/which-key.nvim", config = true, cmd = "WhichKey" },
  -- { "folke/neodev.nvim", opts = {} },
}
