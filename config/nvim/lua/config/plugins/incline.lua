local M = {
  "b0o/incline.nvim",
  dependencies = {
    "nvim-tree/nvim-web-devicons",
  },
  opts = {
    hide = {
      only_win = true,
    },
    window = {
      padding = 0,
      margin = { horizontal = 0 },
    },
    render = function(props)
      local filename = vim.fn.fnamemodify(vim.api.nvim_buf_get_name(props.buf), ":t")
      if filename == "" then
        filename = "[No Name]"
      end
      local ft_icon, ft_color = require("nvim-web-devicons").get_icon_color(filename)
      if ft_icon == nil then
        ft_icon, ft_color = require("nvim-web-devicons").get_icon_color_by_filetype("txt")
      end
      local modified = vim.bo[props.buf].modified
      return {
        ft_icon
            and { " ", ft_icon, " ", guibg = ft_color, guifg = require("incline.helpers").contrast_color(ft_color) }
          or "",
        " ",
        { filename, gui = modified and " bold,italic" or "bold" },
        " ",
      }
    end,
  },
  event = "VeryLazy",
}

return M
