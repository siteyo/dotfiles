return {
  ------------------------------------------------------------
  --- Library
  ------------------------------------------------------------
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
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
        pre_hook = require("ts_context_commentstring.integrations.comment_nvim").create_pre_hook(),
      })
    end,
    dependencies = { "JoosepAlviste/nvim-ts-context-commentstring" },
    event = "BufReadPre",
  },
  { "windwp/nvim-autopairs", config = true, event = "BufReadPost" },
  { "gpanders/editorconfig.nvim", event = "BufReadPost" },
  { "machakann/vim-highlightedyank", event = "BufReadPost" },

  ------------------------------------------------------------
  --- Interface
  ------------------------------------------------------------
  { "stevearc/dressing.nvim", config = true, lazy = "VeryLazy" },
  { "nvim-zh/colorful-winsep.nvim", config = true, event = "WinNew" },

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
  -- { "folke/neodev.nvim", opts = {}, config = true, lazy = false },
}
