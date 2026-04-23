local M = {
  "lambdalisue/nvim-aibo",
  opts = {},
  cmd = { "Aibo", "AiboSend" },
  keys = {
    { "<Leader>aa", "<Cmd>Aibo -toggle gemini<CR>" },
    { "<Leader>as", "<Cmd>AiboSend<CR>" },
  },
  enabled = false,
}

return M
