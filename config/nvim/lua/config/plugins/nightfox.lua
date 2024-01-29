local M = {
  "EdenEast/nightfox.nvim",
  enabled = true,
  cond = not vim.g.vscode,
}

M.opts = {
  palettes = {
    nightfox = {
      bg1 = "#161821",
      bg0 = "#161821",
    },
    nordfox = {
      bg1 = "#161821",
      bg0 = "#161821",
    },
  },
}

return M
