local M = {
  "glepnir/lspsaga.nvim",
  branch = "main",
  event = "BufRead",
  dependencies = { { "nvim-tree/nvim-web-devicons" } },
}

function M.config()
  require("lspsaga").setup({
    ui = {
      code_action = " ",
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

  -- gx
  vim.keymap.set("n", "gh", "<Cmd>Lspsaga finder<CR>")
  vim.keymap.set("n", "gn", "<Cmd>Lspsaga rename<CR>")
  vim.keymap.set("n", "gd", "<Cmd>Lspsaga peek_definition<CR>")
  vim.keymap.set("n", "gD", "<Cmd>Lspsaga goto_definition<CR>")

  -- [Lsp]x
  vim.keymap.set({ "n", "v" }, "[Lsp]a", "<Cmd>Lspsaga code_action<CR>")
  vim.keymap.set("n", "[Lsp]o", "<Cmd>Lspsaga outline<CR>")
  vim.keymap.set("n", "[Lsp]d", "<Cmd>Lspsaga show_cursor_diagnostics<CR>")
  vim.keymap.set("n", "[Lsp]t", "<Cmd>Lspsaga term_toggle<CR>")

  -- other
  vim.keymap.set("n", "[w", "<Cmd>Lspsaga diagnostic_jump_prev<CR>")
  vim.keymap.set("n", "]w", "<Cmd>Lspsaga diagnostic_jump_next<CR>")
  vim.keymap.set("n", "[e", function()
    require("lspsaga.diagnostic"):goto_prev({ severity = vim.diagnostic.severity.ERROR })
  end)
  vim.keymap.set("n", "]e", function()
    require("lspsaga.diagnostic"):goto_next({ severity = vim.diagnostic.severity.ERROR })
  end)
  vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>")
end

return M
