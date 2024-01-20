local M = {
  "chrisgrieser/nvim-tinygit",
  ft = { "gitrebase", "gitcommit" }, -- so ftplugins are loaded
  dependencies = {
    "stevearc/dressing.nvim",
    "nvim-telescope/telescope.nvim", -- either telescope or fzf-lua
    "rcarriga/nvim-notify", -- optional, but will lack some features without it
  },
  event = "VeryLazy",
  keys = {
    {
      "<Leader>gc",
      function()
        require("tinygit").smartCommit()
      end,
      mode = { "n" },
    },
    {
      "<Leader>gl",
      function()
        require("tinygit").searchFileHistory()
      end,
      mode = { "n" },
    },
    {
      "<Leader>gf",
      function()
        require("tinygit").ammendOnlyMsg({ forcePushIfDiverged = false })
      end,
      mode = { "n" },
    },
    {
      "<Leader>gi",
      function()
        require("tinygit").fixupCommit({
          selectFromLastXCommits = 15,
          squashInstead = false,
          autoRebase = false,
        })
      end,
      mode = { "n" },
    },
  },
}

return M
