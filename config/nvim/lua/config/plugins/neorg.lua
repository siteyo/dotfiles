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
    vim.keymap.set("n", "[Neorg]o", "<Cmd>Neorg journal custom<CR>")
    --
    vim.keymap.set("n", "[Neorg]i", "<Cmd>Neorg inject-metadata<CR>")
    -- vim.keymap.set("n", "[Neorg]o", "<Cmd>Neorg toc<CR>")
  end,
  enabled = true,
}
