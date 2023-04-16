return {
  "phaazon/mind.nvim",
  branch = "v2.2",
  dependencies = { "nvim-lua/plenary.nvim" },
  config = function()
    --- Config
    require("mind").setup()

    --- Mappings
    vim.keymap.set("n", "[Mind]m", "<Cmd>MindOpenMain<CR>")
    vim.keymap.set("n", "[Mind]p", "<Cmd>MindOpenProject<CR>")
    vim.keymap.set("n", "[Mind]c", "<Cmd>MindOpenProject<CR>")
    vim.keymap.set("n", "[Mind]s", "<Cmd>MindOpenSmartProject<CR>")
    vim.keymap.set("n", "[Mind]r", "<Cmd>MindReloadState<CR>")
  end,
  keys = "[Mind]",
  enabled = false,
}
