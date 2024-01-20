local M = {
  "glepnir/lspsaga.nvim",
  branch = "main",
  event = "BufRead",
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
  keys = {
    -- gx
    { "gh", "<Cmd>Lspsaga finder<CR>", mode = { "n" } },
    { "gn", "<Cmd>Lspsaga rename<CR>", mode = { "n" } },
    { "gd", "<Cmd>Lspsaga peek_definition<CR>", mode = { "n" } },
    { "gD", "<Cmd>Lspsaga goto_definition<CR>", mode = { "n" } },
    -- <Leaader>lx
    { "<Leader>la", "<Cmd>Lspsaga code_action<CR>", mode = { "n", "v" } },
    { "<Leader>lo", "<Cmd>Lspsaga outline<CR>", mode = { "n" } },
    { "<Leader>ld", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", mode = { "n" } },
    { "<Leader>lt", "<Cmd>Lspsaga term_toggle<CR>", mode = { "n" } },
    -- ]x / [x
    { "[w", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", mode = { "n" } },
    { "]w", "<Cmd>Lspsaga diagnostic_jump_next<CR>", mode = { "n" } },
    {
      "[e",
      function()
        require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
      end,
      mode = { "n" },
    },
    {
      "]e",
      function()
        require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
      end,
      mode = { "n" },
    },
    -- other
    { "K", "<Cmd>Lspsaga hover_doc<CR>", mode = { "n" } },
  },
}

function M.config()
  require("lspsaga").setup({
    ui = {
      code_action = " ",
    },
    symbol_in_winbar = {
      enable = true,
    },
  })
  -- local saga = require("lspsaga")

  -- saga.init_lsp_saga({
  --   code_action_icon = " ",
  --   code_action_lightbulb = {
  --     enable = true,
  --     enable_in_insert = true,
  --     sign = true,
  --     virtual_text = true,
  --   },
  --   definition_action_keys = {
  --     edit = { "o", "<CR>" },
  --     vsplit = "v",
  --     split = "s",
  --     tabe = "t",
  --     quit = "q",
  --   },
  -- })
end

return M
