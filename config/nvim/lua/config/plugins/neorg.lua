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
            notes = "~/notes",
          },
          default_workspace = "notes",
          index = "index.norg",
        },
      },
    },
  },
  dependencies = { { "nvim-lua/plenary.nvim" } },
  keys = "[Neorg]",
  ft = "norg",
  cmd = "Neorg",
  config = function(_, opts)
    --- config
    require("neorg").setup(opts)
    --- keymaps
    -- journal
    vim.keymap.set("n", "[Neorg]t", "<Cmd>Neorg journal toc open<CR>")
    vim.keymap.set("n", "[Neorg]n", "<Cmd>Neorg journal tomorrow<CR>")
    vim.keymap.set("n", "[Neorg]p", "<Cmd>Neorg journal yesterday<CR>")
    vim.keymap.set("n", "[Neorg]j", "<Cmd>Neorg journal today<CR>")

    vim.keymap.set("n", "[Neorg]i", "<Cmd>Neorg index<CR>")
    vim.keymap.set("n", "[Neorg]o", "<Cmd>Neorg toc<CR>")
  end,
  enabled = false,
}
