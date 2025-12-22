local M = {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    bigfile = { enabled = true },
    dashboard = {
      preset = {
        pick = "telescope.nvim",
        keys = {
          -- stylua: ignore start
          { icon = " ", key = "n", desc = "New File", action = ":ene | startinsert" },
          { icon = " ", key = "e", desc = "Explorer", action = ":Oil" },
          { icon = " ", key = "f", desc = "Find File", action = ":lua Snacks.dashboard.pick('files')" },
          { icon = " ", key = "/", desc = "Find Text", action = ":lua Snacks.dashboard.pick('live_grep')" },
          { icon = " ", key = "g", desc = "Git Files", action = ":Telescope git_files" },
          { icon = " ", key = "p", desc = "GitHub PR List", action = ":Octo pr list" },
          { icon = "󰒲 ", key = "L", desc = "Lazy", action = ":Lazy", enabled = package.loaded.lazy ~= nil },
          { icon = " ", key = "s", desc = "Restore Session", section = "session" },
          { icon = " ", key = "c", desc = "Config", action = ":lua Snacks.dashboard.pick('files', {cwd = vim.fn.stdpath('config')})" },
          { icon = " ", key = "q", desc = "Quit", action = ":qa" },
          -- stylua: ignore end
        },
      },
      sections = {
        { section = "header" },
        { section = "keys", gap = 1, padding = 2 },
        { section = "startup" },
        {
          pane = 2,
          icon = " ",
          desc = "Browse Repo",
          padding = 1,
          key = "b",
          action = function()
            Snacks.gitbrowse()
          end,
          enabled = function()
            return Snacks.git.get_root() ~= nil
          end,
        },
        function()
          local in_git = Snacks.git.get_root() ~= nil
          local cmds = {
            {
              title = "Open Issues",
              cmd = "gh issue list -L 3",
              key = "i",
              action = function()
                vim.fn.jobstart("gh issue list --web", { detach = true })
              end,
              icon = " ",
              height = 7,
            },
            {
              icon = " ",
              title = "Open PRs",
              cmd = "gh pr list -L 3",
              key = "P",
              action = function()
                vim.fn.jobstart("gh pr list --web", { detach = true })
              end,
              height = 7,
            },
            {
              icon = " ",
              title = "Git Status",
              cmd = "git status --short --branch --renames",
              height = 5,
            },
            {
              icon = " ",
              title = "Git Diff",
              cmd = "git --no-pager diff --stat -B -M -C",
              height = 10,
            },
          }
          return vim.tbl_map(function(cmd)
            return vim.tbl_extend("force", {
              pane = 2,
              section = "terminal",
              enabled = in_git,
              padding = 1,
              ttl = 5 * 60,
              indent = 3,
            }, cmd)
          end, cmds)
        end,
      },
    },
    image = {
      resolve = function(path, src)
        if require("obsidian.api").path_is_note(path) then
          return require("obsidian.api").resolve_image_path(src)
        end
      end,
    },
    input = {},
    scroll = {},
    statuscolumn = {},
    picker = {
      win = {
        input = {
          keys = {
            ["<C-j>"] = {
              "<C-j>",
              function()
                local key = vim.keycode("<Plug>(skkeleton-enable)")
                vim.api.nvim_feedkeys(key, "n", false)
              end,
              mode = { "i" },
            },
            ["<C-k>"] = false,
          },
        },
      },
    },
    notifier = {},
    gh = {},
  },
  keys = {
    -- stylua: ignore start
    { "sd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "sD", function() Snacks.bufdelete.delete({ force = true, wipe = false }) end, desc = "Delete Buffer(force)" },
    { "<leader>gI", function() Snacks.picker.gh_issue() end, desc = "GitHub Issues" },
    { "<leader>gP", function() Snacks.picker.gh_pr() end, desc = "GitHub Pull Requests" },
    -- stylua: ignore end
  },
}

return M
