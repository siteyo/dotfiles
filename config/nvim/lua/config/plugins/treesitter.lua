local M = {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPre",
    dependencies = {
      "JoosepAlviste/nvim-ts-context-commentstring",
      "windwp/nvim-ts-autotag",
    },
    opts = {
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
      highlight = { enable = true },
      context_commentstring = { enable = true },
      autotag = { enable = true },
    },
    config = function(_, opts)
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- context
{
  "nvim-treesitter/nvim-treesitter-context",
  event = "BufReadPre",
  config = true,
},

  -- playground
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
  },
}

return M
