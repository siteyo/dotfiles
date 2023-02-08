local M = {
  "TimUntersberger/neogit",
  dependencies = {
    "sindrets/diffview.nvim",
  },
  keys = "[Git]",
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
end

return M
