local M = {
  "tpope/vim-fugitive",
  enabled = true,
  cmd = { "Git", "G" },
  keys = {
    { "[Git]s", "<Cmd>Git<CR>" },
    { "[Git]c", "<Cmd>Git commit<CR>" },
    { "[Git]b", "<Cmd>Git blame<CR>" },
    { "[Git]m", "<Cmd>Git merge<CR>" },
    { "[Git]h", "<Cmd>Git branch<CR>" },
    { "[Git]ll", "<Cmd>Git log --graph<CR>" },
    { "[Git]la", "<Cmd>Git log --graph --all --decorate=full<CR>" },
  },
}

return M
