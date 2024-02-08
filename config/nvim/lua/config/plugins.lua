return {
  ------------------------------------------------------------
  --- Library
  ------------------------------------------------------------
  { "nvim-lua/plenary.nvim" },
  { "nvim-tree/nvim-web-devicons" },
  { "MunifTanjim/nui.nvim" },
  {
    "vim-jp/vimdoc-ja",
    event = "VeryLazy",
    config = function()
      vim.o.helplang = "ja,en"
    end,
  },

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

  ------------------------------------------------------------
  --- Interface
  ------------------------------------------------------------
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
  {
    "3rd/image.nvim",
    event = "VeryLazy",
    config = function()
      package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
      package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
      require("image").setup()
    end,
  },
  -- { "folke/which-key.nvim", config = true, cmd = "WhichKey" },
  -- { "folke/neodev.nvim", opts = {}, config = true, lazy = false },
}
