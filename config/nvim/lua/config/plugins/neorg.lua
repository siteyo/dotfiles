local file_exists = function(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

local cp_sample = function()
  local dest_file = vim.fn.expand("$HOME") .. "/notes/neorg/templates/journal.norg"
  if not file_exists(dest_file) then
    vim.fn.jobstart({ "mkdir", "-p", vim.fn.expand("$HOME") .. "/notes/neorg/templates" })
    vim.fn.jobstart({
      "cp",
      vim.fn.stdpath("config") .. "/templates/norg/journal_sample.norg",
      dest_file,
    })
  end
end

return {
  "nvim-neorg/neorg",
  build = { ":Neorg sync-parsers", cp_sample },
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
      ["external.templates"] = {
        config = {
          templates_dir = { vim.fn.expand("$HOME") .. "/notes/neorg/templates" },
          keywords = {
            YESTERDAY_OF_DAY = function()
              local ls = require("luasnip")
              local s = require("neorg.modules.external.templates.default_snippets")
              return ls.text_node(s.parse_date(-1, s.file_tree_date(), [[%Y/%m/%d]]))
            end,
            TODAY_OF_DAY = function()
              local ls = require("luasnip")
              local s = require("neorg.modules.external.templates.default_snippets")
              return ls.text_node(s.parse_date(0, s.file_tree_date(), [[%Y/%m/%d]]))
            end,
            TOMORROW_OF_DAY = function()
              local ls = require("luasnip")
              local s = require("neorg.modules.external.templates.default_snippets")
              return ls.text_node(s.parse_date(1, s.file_tree_date(), [[%d]]))
            end,
          },
        },
      },
    },
  },
  dependencies = {
    { "nvim-neorg/neorg-telescope", dependencies = "nvim-lua/plenary.nvim" },
    { "pysan3/neorg-templates", dependencies = "L3MON4D3/LuaSnip" },
  },
  ft = "norg",
  cmd = "Neorg",
  keys = {
    -- journal
    { "<Leader>ot", "<Cmd>Neorg journal toc open<CR>", mode = { "n" } },
    { "<Leader>on", "<Cmd>Neorg journal tomorrow<CR>", mode = { "n" } },
    { "<Leader>op", "<Cmd>Neorg journal yesterday<CR>", mode = { "n" } },
    { "<Leader>oj", "<Cmd>Neorg journal today<CR>", mode = { "n" } },
    -- neorg-templates
    { "<Leader>oo", "<Cmd>Neorg templates fload journal<CR>", mode = { "n" } },
    -- other
    { "<Leader>oi", "<Cmd>Neorg index<CR>", mode = { "n" } },
    { "<Leader>om", "<Cmd>Neorg inject-metadata<CR>", mode = { "n" } },
    -- for Telescope
    { "<Leader>of", "<Cmd>Telescope neorg find_norg_files<CR>", mode = { "n" } },
    { "<Leader>ol", "<Cmd>Telescope neorg insert_file_link<CR>", mode = { "n" } },
  },
  enabled = true,
}
