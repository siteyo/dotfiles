require("nvim-treesitter.configs").setup({
  ensure_installed = { "lua" },
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
})
