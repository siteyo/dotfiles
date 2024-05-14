local M = {
  "lewis6991/gitsigns.nvim",
  event = "BufReadPre",
  enabled = true,
}

function M.config()
  local gitsigns = require("gitsigns")
  gitsigns.setup({
    signs = {
      add = { hl = "GitSignsAdd", text = "│", numhl = "GitSignsAddNr", linehl = "GitSignsAddLn" },
      change = { hl = "GitSignsChange", text = "│", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
      delete = { hl = "GitSignsDelete", text = "_", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      topdelete = { hl = "GitSignsDelete", text = "‾", numhl = "GitSignsDeleteNr", linehl = "GitSignsDeleteLn" },
      changedelete = { hl = "GitSignsChange", text = "~", numhl = "GitSignsChangeNr", linehl = "GitSignsChangeLn" },
    },
    signcolumn = true, -- Toggle with `:Gitsigns toggle_signs`
    numhl = false, -- Toggle with `:Gitsigns toggle_numhl`
    linehl = false, -- Toggle with `:Gitsigns toggle_linehl`
    word_diff = false, -- Toggle with `:Gitsigns toggle_word_diff`
    watch_gitdir = {
      interval = 1000,
      follow_files = true,
    },
    attach_to_untracked = true,
    current_line_blame = true, -- Toggle with `:Gitsigns toggle_current_line_blame`
    current_line_blame_opts = {
      virt_text = true,
      virt_text_pos = "eol", -- 'eol' | 'overlay' | 'right_align'
      delay = 1000,
      ignore_whitespace = false,
    },
    current_line_blame_formatter = "<author>, <author_time:%Y-%m-%d> - <summary>",
    sign_priority = 6,
    update_debounce = 100,
    status_formatter = nil, -- Use default
    max_file_length = 40000, -- Disable if file is longer than this (in lines)
    preview_config = {
      -- Options passed to nvim_open_win
      border = "single",
      style = "minimal",
      relative = "cursor",
      row = 0,
      col = 1,
    },
    yadm = {
      enable = false,
    },
    on_attach = function(bufnr)
      local function map(mode, lhs, rhs, opts)
        opts = vim.tbl_extend("force", { noremap = true, silent = true }, opts or {})
        vim.api.nvim_buf_set_keymap(bufnr, mode, lhs, rhs, opts)
      end

      -- Navigation
      map("n", "]g", "&diff ? ']g' : '<cmd>Gitsigns next_hunk<CR>'", { expr = true })
      map("n", "[g", "&diff ? '[g' : '<cmd>Gitsigns prev_hunk<CR>'", { expr = true })

      -- Actions
      map("n", "<Leader>ga", "<cmd>Gitsigns stage_hunk<CR>")
      map("x", "<Leader>ga", "<cmd>Gitsigns stage_hunk<CR>")
      map("n", "<Leader>ge", "<cmd>Gitsigns reset_hunk<CR>")
      map("x", "<Leader>ge", "<cmd>Gitsigns reset_hunk<CR>")
      map("n", "<Leader>gm", "<cmd>Gitsigns blame_line<CR>")
      map("v", "<Leader>gm", "<cmd>Gitsigns blame_line<CR>")
      map("n", "<Leader>gu", "<cmd>Gitsigns undo_stage_hunk<CR>")
      map("n", "<Leader>gw", "<cmd>Gitsigns stage_buffer<CR>")
      map("n", "<Leader>gr", "<cmd>Gitsigns reset_buffer<CR>")
      map("n", "<Leader>gp", "<cmd>Gitsigns preview_hunk<CR>")
      map("n", "<Leader>gd", "<cmd>Gitsigns diffthis<CR>")
      map("n", "<Leader>gD", '<cmd>lua require"gitsigns".diffthis("~")<CR>')
      -- map("n", "<Leader>g<Space>b", "<cmd>Gitsigns toggle_current_line_blame<CR>")
      vim.keymap.set("n", "<Leader>g<Space>b", function()
        gitsigns.toggle_current_line_blame()
        vim.notify("[Gitsigns] Toggle current line blame.")
      end, { desc = "Gitsigns: Toggle current line blame" })
      -- map("n", "<Leader>g<Space>d", "<cmd>Gitsigns toggle_deleted<CR>")
      vim.keymap.set("n", "<Leader>g<Space>d", function()
        gitsigns.toggle_deleted()
        vim.notify("[Gitsigns] Toggle deleted.")
      end, { desc = "Gitsigns: Toggle deleted" })
      -- map("n", "<Leader>g<Space>l", "<cmd>Gitsigns toggle_linehl<CR>")
      vim.keymap.set("n", "<Leader>g<Space>l", function()
        gitsigns.toggle_linehl()
        vim.notify("[Gitsigns] Toggle linehl.")
      end, { desc = "Gitsigns: Toggle line highlight" })
      -- map("n", "<Leader>g<Space>n", "<cmd>Gitsigns toggle_numhl<CR>")
      vim.keymap.set("n", "<Leader>g<Space>n", function()
        gitsigns.toggle_numhl()
        vim.notify("[Gitsigns] Toggle numhl.")
      end, { desc = "Gitsigns: Toggle number highlight" })
      -- map("n", "<Leader>g<Space>w", "<cmd>Gitsigns toggle_word_diff<CR>")
      vim.keymap.set("n", "<Leader>g<Space>w", function()
        gitsigns.toggle_word_diff()
        vim.notify("[Gitsigns] Toggle word diff.")
      end, { desc = "Gitsigns: Toggle work diff" })

      -- Text object
      map("o", "ih", ":<C-U>Gitsigns select_hunk<CR>")
      map("x", "ih", ":<C-U>Gitsigns select_hunk<CR>")
    end,
  })
end

return M
