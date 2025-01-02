local M = {
  "folke/snacks.nvim",
  lazy = false,
  opts = {
    bigfile = { enabled = true },
  },
  keys = {
    -- stylua: ignore start
    { "sd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "sD", function() Snacks.bufdelete.delete({ force = true, wipe = false }) end, desc = "Delete Buffer(force)" },
    -- stylua: ignore end
  },
}

return M
