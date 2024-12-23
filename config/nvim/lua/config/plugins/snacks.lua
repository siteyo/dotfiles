local M = {
  "folke/snacks.nvim",
  lazh = false,
  otps = {
    bigfile = { enabled = true },
  },
  keys = {
    -- stylua: ignore start
    { "sd", function() Snacks.bufdelete() end, desc = "Delete Buffer" },
    { "sD", function() Snacks.bufdelete.delete({ force = true, wipe = false }) end },
    -- stylua: ignore end
  },
}

return M
