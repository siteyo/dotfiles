local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-telescope/telescope-frecency.nvim",
    "kkharji/sqlite.lua",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  event = "VimEnter",
  keys = {
    -- for Telescope
    { "<Leader>f<Space>", "<Cmd>Telescope<CR>", mode = { "n" } },
    { "<Leader>ff", "<Cmd>Telescope fd<CR>", mode = { "n" } },
    { "<Leader>fg", "<Cmd>Telescope git_files<CR>", mode = { "n" } },
    { "<Leader>fb", "<Cmd>Telescope buffers<CR>", mode = { "n" } },
    { "<Leader>fm", "<Cmd>Telescope frecency<CR>", mode = { "n" } },
    { "<Leader>fr", "<Cmd>Telescope resume<CR>", mode = { "n" } },
    { "<Leader>fn", "<Cmd>Telescope notify<CR>", mode = { "n" } },
    { "<Leader>fh", "<Cmd>Telescope help_tags<CR>", mode = { "n" } },
    { "<Leader>fd", "<Cmd>Telescope diagnostics<CR>", mode = { "n" } },
    { "<Leader>fe", "<Cmd>Telescope file_browser<CR>", mode = { "n" } },
    -- for Git
    { "<Leader>gs", "<Cmd>Telescope git_status<CR>", mode = { "n" } },
    { "<Leader>gb", "<Cmd>Telescope git_branchs<CR>", mode = { "n" } },
  },
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
end

return M
