return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = "│" },
    whitespace = { highlight = { "Whitespace", "NonText" } },
    scope = {
      show_start = false,
      show_end = false,
    },
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
