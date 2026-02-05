local M = {
  -- treesitter
  {
    "nvim-treesitter/nvim-treesitter",
    build = ":TSUpdate",
    event = { "VeryLazy" },
    opts = {
      ensure_installed = {
        "bash",
        "c",
        "css",
        "diff",
        "dockerfile",
        "fish",
        "gitcommit",
        "gitignore",
        "html",
        "http",
        "javascript",
        "json",
        "lua",
        "luadoc",
        "make",
        "markdown",
        "markdown_inline",
        "python",
        "regex",
        "rust",
        "scss",
        "sql",
        "svelte",
        "todotxt",
        "toml",
        "tsx",
        "typescript",
        "typst",
        "vim",
        "vimdoc",
        "vue",
        "xml",
        "yaml",
      },
      highlight = { enable = true },
      indent = { enable = true },
      -- textobjects = {
      --   select = {
      --     enable = true,
      --     lookahead = true,
      --     keymaps = {
      --       ["af"] = "@function.outer",
      --       ["if"] = "@function.inner",
      --       ["ac"] = "@class.outer",
      --       ["ic"] = "@class.inner",
      --       ["a,"] = "@parameter.outer",
      --       ["i,"] = "@parameter.inner",
      --     },
      --   },
      --   move = {
      --     enable = true,
      --     set_jumps = true,
      --     goto_next_start = {
      --       ["]f"] = "@function.outer",
      --       ["]z"] = { query = "@fold", query_group = "folds" },
      --       -- ["]s"] = { query = "@scope", query_group = "locals" },
      --     },
      --     goto_previous_start = {
      --       ["[f"] = "@function.outer",
      --       ["[z"] = { query = "@fold", query_group = "folds" },
      --       -- ["[s"] = { query = "@scope", query_group = "locals" },
      --     },
      --   },
      -- },
    },
    config = function(_, opts)
      local ts = require("config.treesitter")
      require("nvim-treesitter").setup(opts)
      ts.get_installed(true)
      local install = vim.tbl_filter(function(what)
        local lang = vim.treesitter.language.get_lang(what)
        return not ts.get_installed()[lang]
      end, opts.ensure_installed or {})
      require("nvim-treesitter").install(install, { summary = true }):await(function()
        ts.get_installed(true)
      end)

      vim.api.nvim_create_autocmd("FileType", {
        callback = function(ev)
          local ft, lang = ev.match, vim.treesitter.language.get_lang(ev.match)
          local function enabled(feat, query)
            local f = opts[feat] or {}
            return f.enable ~= false and not (type(f.disable) == "table" and vim.tbl_contains(f.disable, lang))
          end
          if enabled("highlight", "highlights") then
            pcall(vim.treesitter.start, ev.buf)
          end
        end,
      })
    end,
    enabled = true,
  },

  -- context
  {
    "nvim-treesitter/nvim-treesitter-context",
    event = "BufReadPre",
    config = true,
    enabled = false,
  },
  -- text objects
  {
    "nvim-treesitter/nvim-treesitter-textobjects",
    event = "BufReadPre",
    enabled = false,
  },
  -- playground
  {
    "nvim-treesitter/playground",
    cmd = "TSPlaygroundToggle",
    enabled = false,
  },
}

return M
