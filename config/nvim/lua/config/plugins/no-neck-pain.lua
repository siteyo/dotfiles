local M = {
  "shortcuts/no-neck-pain.nvim",
  lazy = false,
  keys = {
    { "<Leader>np", "<Cmd>NoNeckPain<CR>", mode = { "n" }, desc = "NoNeckPain" },
    { "<Leader>nl", "<Cmd>NoNeckPainToggleRightSide<CR>", mode = { "n" }, desc = "NoNeckPainToggleRightSide" },
    { "<Leader>nh", "<Cmd>NoNeckPainToggleLeftSide<CR>", mode = { "n" }, desc = "NoNeckPainToggleLeftSide" },
  },
  opts = {
    width = 100,
    autocmds = {
      -- enableOnVimEnter = true,
      enableOnTabEnter = true,
    },
  },
  config = function(_, opts)
    require("no-neck-pain").setup(opts)
    vim.opt.sessionoptions:remove("blank")

    local map_s = require("config.util").map_submode
    map_s("n", "<Leader>nk", "k", "<Cmd>NoNeckPainWidthUp<CR>", { desc = "NoNeckPainWidthUp" })
    map_s("n", "<Leader>nj", "j", "<Cmd>NoNeckPainWidthDown<CR>", { desc = "NoNeckPainWidthUp" })
  end,
}

return M
