local M = {
  "tpope/vim-fugitive",
  enabled = true,
  cmd = { "Git", "G" },
  keys = {
    { "<Leader>gs", "<Cmd>Git<CR>", mode = { "n" } },
    { "<Leader>gc", "<Cmd>Git commit<CR>", mode = { "n" } },
    { "<Leader>gb", "<Cmd>Git blame<CR>", mode = { "n" } },
    -- { "<Leader>gm", "<Cmd>Git merge<CR>", mode = { "n"} },
    { "<Leader>gh", "<Cmd>Git branch<CR>", mode = { "n" } },
    { "<Leader>gll", "<Cmd>Git log --graph<CR>", mode = { "n" } },
    { "<Leader>gla", "<Cmd>Git log --graph --all --decorate=full<CR>", mode = { "n" } },
  },
}

return M
