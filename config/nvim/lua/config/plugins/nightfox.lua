local M = {
  "EdenEast/nightfox.nvim",
}

function M.config()
  require("nightfox").setup({
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
  })
end

return M
