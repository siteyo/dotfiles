local actions = require("telescope.actions")
require("telescope").setup({
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
      n = {},
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
