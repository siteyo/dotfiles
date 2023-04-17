local M = {
  "TimUntersberger/neogit",
  dependencies = {
    "sindrets/diffview.nvim",
  },
  keys = "[Git]",
  enabled = false,
}

M.config = function()
  local neogit = require("neogit")
  neogit.setup({
    disable_commit_confirmation = true,
    disable_hint = true,
    integrations = {
      diffview = true,
    },
  })

  vim.keymap.set("n", "[Git]s", function()
    neogit.open()
  end)
  vim.keymap.set("n", "[Git]c", function()
    neogit.open({ "commit" })
  end)
  vim.keymap.set("n", "[Git]l", function()
    neogit.open({ "log" })
  end)
  vim.keymap.set("n", "[Git]h", function()
    neogit.open({ "branch" })
  end)
end

return M
