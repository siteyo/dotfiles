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
      diffview = true,
    },
    kind = "replace",
  },
  keys = {
    {
      "<Leader>gs",
      function()
        require("neogit").open()
      end,
      desc = "Neogit status",
    },
    {
      "<Leader>gc",
      function()
        require("neogit").open({ "commit" })
      end,
      desc = "Neogit commit",
    },
    {
      "<Leader>gl",
      function()
        require("neogit").open({ "log" })
      end,
      desc = "Neogit log",
    },
    {
      "<Leader>gb",
      function()
        require("neogit").open({ "branch" })
      end,
      desc = "Neogit branch",
    },
  },
  enabled = true,
}

-- M.config = function()
--   local neogit = require("neogit")
--   neogit.setup({
--     disable_commit_confirmation = true,
--     disable_hint = true,
--     integrations = {
--       diffview = true,
--     },
--   })
--
--   vim.keymap.set("n", "<Leader>gs", function()
--     neogit.open()
--   end)
--   vim.keymap.set("n", "<Leader>gc", function()
--     neogit.open({ "commit" })
--   end)
--   vim.keymap.set("n", "<Leader>gl", function()
--     neogit.open({ "log" })
--   end)
--   vim.keymap.set("n", "<Leader>gh", function()
--     neogit.open({ "branch" })
--   end)
-- end

return M
