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
  ft = "norg",
  cmd = "Neorg",
  keys = {
    -- journal
    { "<Leader>ot", "<Cmd>Neorg journal toc open<CR>", mode = { "n" } },
    { "<Leader>on", "<Cmd>Neorg journal toc tomorrow<CR>", mode = { "n" } },
    { "<Leader>op", "<Cmd>Neorg journal toc yesterday<CR>", mode = { "n" } },
    { "<Leader>oj", "<Cmd>Neorg journal toc today<CR>", mode = { "n" } },
    { "<Leader>oo", "<Cmd>Neorg journal toc custom<CR>", mode = { "n" } },
    -- other
    { "<Leader>oi", "<Cmd>Neorg index<CR>", mode = { "n" } },
    { "<Leader>om", "<Cmd>Neorg inject-metadata<CR>", mode = { "n" } },
    -- for Telescope
    { "<Leader>of", "<Cmd>Telescope neorg find_norg_files<CR>", mode = { "n" } },
    { "<Leader>ol", "<Cmd>Telescope neorg insert_file_link<CR>", mode = { "n" } },
  },
  enabled = true,
}
