return {
  "lukas-reineke/indent-blankline.nvim",
  opts = {
    show_current_context = false,
    show_current_context_start = false,
    filetype_exclude = { "help", "alpha", "neo-tree", "Trouble", "lazy", "mind" },
  },
  event = { "BufReadPost", "BufNewFile" },
}
