local M = {
  "tpope/vim-fugitive",
  enabled = true,
  cmd = { "Git", "G" },
  keys = {
    { "<Leader>gs", "<Cmd>Git<CR>" },
    { "<Leader>gc", "<Cmd>Git commit<CR>" },
    { "<Leader>gb", "<Cmd>Git blame<CR>" },
    -- { "<Leader>gm", "<Cmd>Git merge<CR>" },
    { "<Leader>gh", "<Cmd>Git branch<CR>" },
    { "<Leader>gll", "<Cmd>Git log --graph<CR>" },
    { "<Leader>gla", "<Cmd>Git log --graph --all --decorate=full<CR>" },
  },
}

return M
