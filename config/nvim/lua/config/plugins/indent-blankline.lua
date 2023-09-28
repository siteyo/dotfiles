return {
  "lukas-reineke/indent-blankline.nvim",
  main = "ibl",
  opts = {
    indent = { char = "│" },
    show_current_context = false,
    show_current_context_start = false,
    filetype_exclude = { "help", "alpha", "neo-tree", "Trouble", "lazy", "mind" },
  },
  event = { "BufReadPost", "BufNewFile" },
}
