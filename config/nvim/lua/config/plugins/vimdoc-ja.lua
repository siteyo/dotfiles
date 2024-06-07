local M = {
  "vim-jp/vimdoc-ja",
  keys = { { "h", mode = "c" } },
  config = function()
    vim.o.helplang = "ja,en"
  end,
}

return M
