local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
    "danielfalk/smart-open.nvim",
    "kkharji/sqlite.lua",
  },
  cmd = { "Telescope", "FrecencyValidate" },
  keys = {
    -- for Telescope
    { "<Leader><space>", "<cmd>Telescope<CR>", mode = { "n" }, desc = "Builtin Pickers" },
    { "<Leader>/", "<Cmd>Telescope live_grep<CR>", mode = { "n" }, desc = "Grep" },
    { "<Leader>:", "<Cmd>Telescope command_history<CR>", mode = { "n" }, desc = "Command History" },

    -- find
    { "<Leader>ff", "<Cmd>Telescope fd<CR>", mode = { "n" } },
    { "<Leader>fg", "<Cmd>Telescope git_files<CR>", mode = { "n" } },
    { "<Leader>fb", "<Cmd>Telescope buffers<CR>", mode = { "n" } },
    { "<Leader>fm", "<Cmd>Telescope smart_open<CR>", mode = { "n" } },
    { "<Leader>fr", "<Cmd>Telescope resume<CR>", mode = { "n" } },
    { "<Leader>fn", "<Cmd>Telescope notify<CR>", mode = { "n" } },
    { "<Leader>fh", "<Cmd>Telescope help_tags<CR>", mode = { "n" } },
    { "<Leader>fd", "<Cmd>Telescope diagnostics<CR>", mode = { "n" } },
    { "<Leader>fe", "<Cmd>Telescope file_browser<CR>", mode = { "n" } },
    { '<Leader>f"', "<cmd>Telescope registers<CR>", mode = { "n" } },

    -- for Git
    { "<Leader>gs", "<Cmd>Telescope git_status<CR>", mode = { "n" } },
    { "<Leader>gb", "<Cmd>Telescope git_branches<CR>", mode = { "n" } },
  },
}

function M.config()
  --- Config
  local telescope = require("telescope")
  local actions = require("telescope.actions")
  telescope.setup({
    defaults = {
      layout_strategy = "vertical",
      mappings = {
        i = {
          ["<C-j>"] = { "<Plug>(skkeleton-enable)", type = "command" },
          ["<C-n>"] = {
            actions.move_selection_next,
            type = "action",
            opts = { nowait = true, silent = true },
          },
          ["<C-p>"] = {
            actions.move_selection_previous,
            type = "action",
            opts = { nowait = true, silent = true },
          },
          -- ["<C-[>"] = {
          --   actions.close,
          --   type = "action",
          --   opts = { nowait = true, silent = true },
          -- },
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
        },
        db_safe_mode = false,
        auto_validate = false,
      },
    },
  })

  -- telescope-frecency
  telescope.load_extension("frecency")

  -- telescope-file-browser
  telescope.load_extension("file_browser")

  -- nvim-notify
  telescope.load_extension("notify")

  -- smart-open.nvim
  telescope.load_extension("smart_open")

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
