local M = {
  "stevearc/oil.nvim",
  opts = {
    default_file_explorer = true,
    use_default_keymap = false,
    columns = {
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
      ["gd"] = {
        desc = "Toggle file detail view",
        callback = function()
          detail = not detail
          if detail then
            require("oil").set_columns({ "icon", "permissions", "size", "mtime" })
          else
            require("oil").set_columns({ "icon" })
          end
        end,
      },
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
