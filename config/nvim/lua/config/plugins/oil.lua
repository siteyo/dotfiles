local M = {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
    use_default_keymap = false,
    columns = {
      "permissions",
      "icon",
    },
    keymaps = {
      ["g?"] = "actions.show_help",
      ["<CR>"] = "actions.select",
      ["<C-p>"] = "actions.preview",
      ["q"] = "actions.close",
      ["<C-l>"] = "actions.refresh",
      ["<C-h>"] = "actions.parent",
      ["H"] = "actions.toggle_hidden",
      ["gs"] = "actions.change_sort",
      ["-"] = "actions.open_cwd",
    },
  },
  -- Optional dependencies
  dependencies = { "nvim-tree/nvim-web-devicons" },
  lazy = false,
  keys = {
    { "<Leader>ee", "<Cmd>Oil<CR>", mode = { "n" }, desc = "Explorer Oil.nvim" },
    { "<Leader>ef", "<Cmd>Oil --float<CR>", mode = { "n" }, desc = "Explorer Oil.nvim (float)" },
  },
}

return M
