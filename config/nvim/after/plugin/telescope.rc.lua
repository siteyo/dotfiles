local status, telescope = pcall(require, "telescope")
if not status then return end

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
      ignore_patterns = { "*.git/*", "*/tmp/*", "*/node_modules/*" },
      db_safe_mode = false,
      auto_validate = true,
    },
  },
})

vim.keymap.set("n", "[FuzzyFinder]<Space>", "<Cmd>Telescope<CR>")
vim.keymap.set("n", "[FuzzyFinder]f", "<Cmd>Telescope find_files<CR>")
vim.keymap.set("n", "[FuzzyFinder]g", "<Cmd>Telescope git_files<CR>")
vim.keymap.set("n", "[FuzzyFinder]s", "<Cmd>Telescope git_status<CR>")
vim.keymap.set("n", "[FuzzyFinder]b", "<Cmd>Telescope buffers<CR>")
vim.keymap.set("n", "[FuzzyFinder]m", "<Cmd>Telescope frecency<CR>")
vim.keymap.set("n", "[FuzzyFinder]n", "<Cmd>Telescope notify<CR>")
vim.keymap.set("n", "[FuzzyFinder]h", "<Cmd>Telescope help_tags<CR>")
vim.keymap.set("n", "[FuzzyFinder]d", "<Cmd>Telescope diagnostics<CR>")
vim.keymap.set("n", "[FuzzyFinder]e", "<Cmd>Telescope file_browser<CR>")
