local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-frecency.nvim",
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  event = "VimEnter",
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
          ["<C-[>"] = {
            actions.close,
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

  -- for git
  -- local previewers = require("telescope.previewers")
  -- local builtin = require("telescope.builtin")
  -- local delta = previewers.new_termopen_previewer({
  --   get_command = function(entry)
  --     if entry.status == "??" or "A " then
  --       return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value }
  --     end
  --     return { "git", "-c", "core.pager=delta", "-c", "delta.side-by-side=false", "diff", entry.value .. "^!" }
  --   end,
  -- })
  -- local delta_commits = function(opts)
  --   opts = opts or {}
  --   opts.previewer = delta
  --   builtin.git_commits(opts)
  -- end
  -- local delta_status = function(opts)
  --   opts = opts or {}
  --   opts.previewer = delta
  --   builtin.git_status(opts)
  -- end

  --- Mappings
  vim.keymap.set("n", "<Leader>f<Space>", "<Cmd>Telescope<CR>")
  vim.keymap.set("n", "<Leader>ff", "<Cmd>Telescope fd<CR>")
  vim.keymap.set("n", "<Leader>fg", "<Cmd>Telescope git_files<CR>")
  vim.keymap.set("n", "<Leader>fs", "<Cmd>Telescope git_status<CR>")
  -- vim.keymap.set("n", "<Leader>fs", function()
  --   builtin.git_status({ previewer = delta })
  -- end)
  vim.keymap.set("n", "<Leader>fb", "<Cmd>Telescope buffers<CR>")
  vim.keymap.set("n", "<Leader>fm", "<Cmd>Telescope frecency<CR>")
  vim.keymap.set("n", "<Leader>fr", "<Cmd>Telescope resume<CR>")
  vim.keymap.set("n", "<Leader>fn", "<Cmd>Telescope notify<CR>")
  vim.keymap.set("n", "<Leader>f?", "<Cmd>Telescope help_tags<CR>")
  vim.keymap.set("n", "<Leader>fd", "<Cmd>Telescope diagnostics<CR>")
  vim.keymap.set("n", "<Leader>fe", "<Cmd>Telescope file_browser<CR>")
end

return M
