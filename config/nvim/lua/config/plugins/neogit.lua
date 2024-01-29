local M = {
  "TimUntersberger/neogit",
  dependencies = {
    "sindrets/diffview.nvim",
  },
  keys = "<Leader>g",
  enabled = false,
  cond = not vim.g.vscode,
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

  vim.keymap.set("n", "<Leader>gs", function()
    neogit.open()
  end)
  vim.keymap.set("n", "<Leader>gc", function()
    neogit.open({ "commit" })
  end)
  vim.keymap.set("n", "<Leader>gl", function()
    neogit.open({ "log" })
  end)
  vim.keymap.set("n", "<Leader>gh", function()
    neogit.open({ "branch" })
  end)
end

return M
