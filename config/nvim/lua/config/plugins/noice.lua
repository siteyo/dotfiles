local M = {
  "folke/noice.nvim",
  dependencies = {
    "MunifTanjim/nui.nvim",
    "rcarriga/nvim-notify",
  },
  event = "VeryLazy",
  -- keys = {
  --   {
  --     "<Leader>nl",
  --     function()
  --       require("noice").cmd("last")
  --     end,
  --     mode = { "n" },
  --   },
  --   {
  --     "<Leader>nt",
  --     function()
  --       require("noice").cmd("telescope")
  --     end,
  --     mode = { "n" },
  --   },
  --   {
  --     "<Leader>ne",
  --     function()
  --       require("noice").cmd("errors")
  --     end,
  --     mode = { "n" },
  --   },
  -- },
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
      filter = { event = "msg_showmode", find = "--%s%p*%a+%p*%s--" },
      opts = { skip = true },
    },
    {
      view = "virtualtext",
      filter = {
        any = {
          { event = "msg_show", kind = "search_count" },
          { event = "msg_showmode", find = "recording @.$" },
        },
      },
    },
    {
      view = "mini",
      filter = {
        any = {
          { event = "msg_show", find = "written" },
          { event = "msg_show", find = "yanked" },
          { event = "msg_show", find = "more line" },
          { event = "msg_show", find = "line less" },
          { event = "msg_show", find = "fewer line" },
          { event = "msg_show", find = "^Hunk %d+ of %d+$" },
          { event = "msg_show", kind = "emsg", find = "E%d+:" },
          { event = "msg_show", kind = "wmsg", find = "search hit .* continuing at" },
        },
      },
    },
    {
      view = "notify",
      filter = {
        event = "msg_show",
        kind = { "", "echo", "echomsg", "lua_print", "list_cmd" },
      },
      opts = { replace = true, merge = true, title = "Messages" },
    },
    {
      view = "notify",
      filter = {
        any = {
          { event = "msg_show", find = "[orgmode].*" },
        },
      },
    },
    {
      view = "split",
      filter = { event = "msg_show", cmdline = true },
    },
  },
}

return M
