local status, saga = pcall(require, "lspsaga")
if not status then
  return
end

saga.init_lsp_saga({
  code_action_icon = " ",
  code_action_lightbulb = {
    enable = true,
    enable_in_insert = true,
    sign = true,
    virtual_text = true,
  },
  definition_action_keys = {
    edit = { "o", "<CR>" },
    vsplit = "v",
    split = "s",
    tabe = "t",
    quit = "q",
  },
})

local opts = { noremap = true, silent = true }

-- gx
vim.keymap.set("n", "gh", "<Cmd>Lspsaga lsp_finder<CR>", opts)
vim.keymap.set("n", "gn", "<Cmd>Lspsaga rename<CR>", opts)
vim.keymap.set("n", "gd", "<Cmd>Lspsaga peek_definition<CR>", opts)
vim.keymap.set("n", "gD", vim.lsp.buf.definition, opts)

-- [Lsp]x
vim.keymap.set({ "n", "v" }, "[Lsp]a", "<Cmd>Lspsaga code_action<CR>", opts)
vim.keymap.set("n", "[Lsp]o", "<Cmd>LSoutlineToggle<CR>", opts)
vim.keymap.set("n", "[Lsp]d", "<Cmd>Lspsaga show_cursor_diagnostics<CR>", opts)

-- other
vim.keymap.set("n", "[w", "<Cmd>Lspsaga diagnostic_jump_prev<CR>", opts)
vim.keymap.set("n", "]w", "<Cmd>Lspsaga diagnostic_jump_next<CR>", opts)
vim.keymap.set("n", "[e", function()
  saga.diagnostic.goto_prev({ severity = vim.diagnostic.severity.ERROR })
end, opts)
vim.keymap.set("n", "]e", function()
  saga.diagnostic.goto_next({ severity = vim.diagnostic.severity.ERROR })
end, opts)
vim.keymap.set("n", "K", "<cmd>Lspsaga hover_doc<CR>", opts)
