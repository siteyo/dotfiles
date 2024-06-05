local M = {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-telescope/telescope-frecency.nvim",
    "nvim-telescope/telescope-file-browser.nvim",
  },
  cmd = "Telescope",
  keys = {
    -- for Telescope
    { "<leader><space>", "<cmd>Telescope<cr>", mode = { "n" }, desc = "Find Files" },
    { "<leader>/", "<Cmd>Telescope live_grep<cr>", mode = { "n" }, desc = "Grep" },
    { "<leader>:", "<Cmd>Telescope command_history<cr>", mode = { "n" }, desc = "Command History" },

    -- find
    { "<leader>ff", "<Cmd>Telescope fd<cr>", mode = { "n" } },
    { "<leader>fg", "<Cmd>Telescope git_files<cr>", mode = { "n" } },
    { "<leader>fb", "<Cmd>Telescope buffers<cr>", mode = { "n" } },
    { "<leader>fm", "<Cmd>Telescope frecency<cr>", mode = { "n" } },
    { "<leader>fr", "<Cmd>Telescope resume<cr>", mode = { "n" } },
    { "<leader>fn", "<Cmd>Telescope notify<cr>", mode = { "n" } },
    { "<leader>fh", "<Cmd>Telescope help_tags<cr>", mode = { "n" } },
    { "<leader>fd", "<Cmd>Telescope diagnostics<cr>", mode = { "n" } },
    { "<leader>fe", "<Cmd>Telescope file_browser<cr>", mode = { "n" } },
    { '<leader>f"', "<cmd>Telescope registers<cr>", mode = { "n" } },

    -- for Git
    { "<leader>gs", "<Cmd>Telescope git_status<cr>", mode = { "n" } },
    { "<leader>gb", "<Cmd>Telescope git_branches<cr>", mode = { "n" } },
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
