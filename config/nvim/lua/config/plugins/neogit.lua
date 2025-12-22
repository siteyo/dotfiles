local M = {
  "TimUntersberger/neogit",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "sindrets/diffview.nvim",
    "nvim-telescope/telescope.nvim",
  },
  opts = {
    disable_commit_confirmation = true,
    disable_hint = true,
    integrations = {
      telescope = true,
      diffview = true,
    },
    kind = "tab",
    graph_style = "unicode",
  },
  keys = {
    {
      "<Leader>gg",
      function()
        require("neogit").open()
      end,
      desc = "Neogit status",
    },
    -- {
    --   "<Leader>gc",
    --   function()
    --     require("neogit").open({ "commit" })
    --   end,
    --   desc = "Neogit commit",
    -- },
    -- {
    --   "<Leader>gl",
    --   function()
    --     require("neogit").open({ "log" })
    --   end,
    --   desc = "Neogit log",
    -- },
    -- {
    --   "<Leader>gb",
    --   function()
    --     require("neogit").open({ "branch" })
    --   end,
    --   desc = "Neogit branch",
    -- },
  },
  enabled = true,
}

return M
