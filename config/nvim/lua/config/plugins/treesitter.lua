local M = {
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPre",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
    },
    config = function()
      local treesitter_config = require("nvim-treesitter.configs")
      treesitter_config.setup({
        ensure_installed = {
          "bash",
          "c",
          "css",
          "diff",
          "dockerfile",
          "gitcommit",
          "gitignore",
          "help",
          "html",
          "javascript",
          "json",
          "lua",
          "make",
          "markdown",
          "markdown_inline",
          "python",
          "regex",
          "rust",
          "sql",
          "todotxt",
          "toml",
          "tsx",
          "typescript",
          "vim",
          "yaml",
        },
        highlight = {
          enable = true,
        },
        context_commentstring = {
          enable = true,
        },
        autotag = {
          enable = true,
        },
      })
    end,
  },
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
  },
}

return M
