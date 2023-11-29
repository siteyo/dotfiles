return {
  "nvim-neorg/neorg",
  build = ":Neorg sync-parsers",
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = "~/notes/neorg",
          },
          default_workspace = "notes",
          index = "inbox.norg",
        },
      },
      ["core.export"] = {},
      ["core.export.markdown"] = {},
      ["core.completion"] = {
        config = { engine = "nvim-cmp" },
      },
      ["core.integrations.nvim-cmp"] = {},
      ["core.integrations.telescope"] = {},
    },
  },
  dependencies = { { "nvim-lua/plenary.nvim" }, { "nvim-neorg/neorg-telescope" } },
  keys = "<Leader>o",
  ft = "norg",
  cmd = "Neorg",
  config = function(_, opts)
    --- config
    require("neorg").setup(opts)
    --- keymaps
    -- journal
    vim.keymap.set("n", "<Leader>ot", "<Cmd>Neorg journal toc open<CR>")
    vim.keymap.set("n", "<Leader>on", "<Cmd>Neorg journal tomorrow<CR>")
    vim.keymap.set("n", "<Leader>op", "<Cmd>Neorg journal yesterday<CR>")
    vim.keymap.set("n", "<Leader>oj", "<Cmd>Neorg journal today<CR>")
    vim.keymap.set("n", "<Leader>oo", "<Cmd>Neorg journal custom<CR>")
    --
    vim.keymap.set("n", "<Leader>oi", "<Cmd>Neorg index<CR>")
    vim.keymap.set("n", "<Leader>om", "<Cmd>Neorg inject-metadata<CR>")
    -- vim.keymap.set("n", "<Leader>oo", "<Cmd>Neorg toc<CR>")
  end,
  enabled = true,
}
