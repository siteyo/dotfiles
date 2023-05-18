local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-frecency.nvim",
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  keys = "[FuzzyFinder]",
}

function M.config()
  --- Config
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  telescope.setup({
    defaults = {
      mappings = {
        i = {
          ["<C-j>"] = {
            actions.move_selection_next,
            type = "action",
            opts = { nowait = true, silent = true },
          },
          ["<C-k>"] = {
            actions.move_selection_previous,
            type = "action",
            opts = { nowait = true, silent = true },
          },
        },
        n = {
          ["q"] = {
            actions.close,
            type = "action",
            opts = { nowait = true, silent = true },
          },
        },
      },
    },
    extensions = {
      frecency = {
        ignore_patterns = {
          "*.git/*",
          "*/tmp/*",
          "*/node_modules/*",
          "*/.mind/*",
          "*/mind.nvim/*",
        },
        db_safe_mode = false,
        auto_validate = true,
      },
    },
  })

  -- telescope-frecency
  telescope.load_extension("frecency")

  -- telescope-file-browser
  telescope.load_extension("file_browser")

  -- nvim-notify
  telescope.load_extension("notify")

  --- Mappings
  vim.keymap.set("n", "[FuzzyFinder]<Space>", "<Cmd>Telescope<CR>")
  vim.keymap.set("n", "[FuzzyFinder]f", "<Cmd>Telescope find_files<CR>")
  vim.keymap.set("n", "[FuzzyFinder]g", "<Cmd>Telescope git_files<CR>")
  vim.keymap.set("n", "[FuzzyFinder]s", "<Cmd>Telescope git_status<CR>")
  vim.keymap.set("n", "[FuzzyFinder]h", "<Cmd>Telescope git_branches<CR>")
  vim.keymap.set("n", "[FuzzyFinder]b", "<Cmd>Telescope buffers<CR>")
  vim.keymap.set("n", "[FuzzyFinder]m", "<Cmd>Telescope frecency<CR>")
  vim.keymap.set("n", "[FuzzyFinder]n", "<Cmd>Telescope notify<CR>")
  vim.keymap.set("n", "[FuzzyFinder]?", "<Cmd>Telescope help_tags<CR>")
  vim.keymap.set("n", "[FuzzyFinder]d", "<Cmd>Telescope diagnostics<CR>")
  vim.keymap.set("n", "[FuzzyFinder]e", "<Cmd>Telescope file_browser<CR>")
end

return M
