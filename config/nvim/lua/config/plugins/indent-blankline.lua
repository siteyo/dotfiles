return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = "│" },
    whitespace = { highlight = { "Whitespace", "NonText" } },
    exclude = {
      filetypes = {
        "lspinfo",
        "checkhealth",
        "man",
        "gitcommit",
        "help",
        "alpha",
        "neo-tree",
        "Trouble",
        "lazy",
        "mind",
      },
    },
  },
  event = { "BufReadPost", "BufNewFile" },
}
