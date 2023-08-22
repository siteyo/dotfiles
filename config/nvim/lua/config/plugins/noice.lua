local M = {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  event = "VeryLazy",
}

M.opts = {
  -- messages = {
  --   enable = true,
  --   view = "mini",
  --   view_error = "mini",
  --   view_warn = "mini",
  --   view_search = "virtualtext",
  -- },
  lsp = {
    override = {
      ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
      ["vim.lsp.util.stylize_markdown"] = true,
      ["cmp.entry.get_documentation"] = true,
    },
  },
  presets = {
    bottom_search = true,
    command_palette = true,
    long_message_to_split = true,
  },
  routes = {
    {
      view = "notify",
      filter = { event = "msg_showmode" },
    },
    {
      view = "mini",
      filter = {
        any = {
          { event = "msg_show", find = "written" },
          { event = "msg_show", find = "yanked" },
          { event = "msg_show", kind = "emsg", find = "E486" },
          { event = "msg_show", kind = "wmsg", find = "search hit .* continuing at" },
        },
      },
    },
    {
      view = "split",
      filter = { event = "msg_show", cmdline = true },
    },
  },
}

M.config = function(_, opts)
  local noice = require("noice")
  noice.setup(opts)

  vim.keymap.set("n", "[Noice]l", function()
    noice.cmd("last")
  end)
  vim.keymap.set("n", "[Noice]t", function()
    noice.cmd("telescope")
  end)
  vim.keymap.set("n", "[Noice]e", function()
    noice.cmd("errors")
  end)
end

return M
