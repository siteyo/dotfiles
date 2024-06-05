local M = {
  "akinsho/bufferline.nvim",
  event = "VeryLazy",
  enabled = true,
  keys = {
    { "sn", "<cmd>BufferLineCycleNext<cr>", mode = { "n" }, desc = "Next Buffer" },
    { "sp", "<cmd>BufferLineCyclePrev<cr>", mode = { "n" }, desc = "Prev Buffer" },
    { "sN", "<cmd>BufferLineMoveNext<cr>", mode = { "n" }, desc = "Move buffer next" },
    { "sP", "<cmd>BufferLineMovePrev<cr>", mode = { "n" }, desc = "Move buffer prev" },
    {
      "<Leader>bs",
      function()
        vim.ui.select({ "tabs", "directory", "extension" }, { prompt = "Sort by" }, function(choice)
          if choice then
            require("bufferline").sort_by(choice)
          end
        end)
      end,
      mode = { "n" },
      desc = "Select sort method",
    },
    { "<Leader>bp", "<Cmd>BufferLineTogglePin<cr>", mode = { "n" }, desc = "Toggle Pin" },
    { "<leader>bP", "<cmd>BufferLineGroupClose ungrouped<cr>", mode = { "n" }, desc = "Delete Non-Pinned Buffers" },
    { "<leader>bo", "<cmd>BufferLineCloseOthers<cr>", mode = { "n" }, desc = "Delete Other Buffers" },
  },
}

M.opts = {
  options = {
    mode = "buffers",
    numbers = function(opts)
      return string.format("%s.%s", opts.ordinal, opts.raise(opts.id))
    end,
    indicator = {
      style = "underline",
    },
    diagnostics = "nvim_lsp",
    diagnostics_indicator = function(count, level)
      local icon = level:match("error") and " " or ""
      return " " .. icon .. count
    end,
    show_buffer_close_icons = false,
    show_close_icon = false,
    show_tab_indicators = true,
    separator_style = "slant",
    always_show_bufferline = true,
    sort_by = "directory",
  },
  -- highlights = require("catppuccin.groups.integrations.bufferline").get({ styles = { "bold" } }),
  highlights = {
    buffer_selected = { italic = false },
    numbers_selected = { italic = false },
    diagnostic_selected = { italic = false },
    hint_selected = { italic = false },
    hint_diagnostic_selected = { italic = false },
    info_selected = { italic = false },
    info_diagnostic_selected = { italic = false },
    warning_selected = { italic = false },
    warning_diagnostic_selected = { italic = false },
    error_selected = { italic = false },
    error_diagnostic_selected = { italic = false },
    duplicate_selected = { italic = false },
    duplicate_visible = { italic = false },
    duplicate = { italic = false },
    pick_selected = { italic = false },
    pick_visible = { italic = false },
    pick = { italic = false },
  },
}

return M
