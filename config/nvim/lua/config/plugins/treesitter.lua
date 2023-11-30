local M = {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = "BufReadPre",
    dependencies = {
      "nvim-treesitter/nvim-treesitter-textobjects",
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
        "vimdoc",
        "yaml",
      },
      highlight = { enable = true },
      autotag = { enable = true },
      textobjects = {
        select = {
          enable = true,
          lookahead = true,
          keymaps = {
            ["af"] = "@function.outer",
            ["if"] = "@function.inner",
            ["ac"] = "@class.outer",
            ["ic"] = "@class.inner",
            ["a,"] = "@parameter.outer",
            ["i,"] = "@parameter.inner",
          },
        },
        move = {
          enable = true,
          set_jumps = true,
          goto_next_start = {
            ["]f"] = "@function.outer",
            ["]z"] = { query = "@fold", query_group = "folds" },
            -- ["]s"] = { query = "@scope", query_group = "locals" },
          },
          goto_previous_start = {
            ["[f"] = "@function.outer",
            ["[z"] = { query = "@fold", query_group = "folds" },
            -- ["[s"] = { query = "@scope", query_group = "locals" },
          },
        },
      },
    },
    config = function(_, opts)
      -- require("nvim-treesitter.install").prefer_git = true
      require("nvim-treesitter.configs").setup(opts)
    end,
  },

  -- context
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = true,
  },
  -- text objects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufReadPre",
  },
  -- playground
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
  },
}

return M
