local setup = function()
  local home = vim.fn.expand("$HOME")
  local exists = function(name)
    local f = io.open(name, "r")
    if f ~= nil then
      io.close(f)
      return true
    else
      return false
    end
  end

  local setup_directory = function()
    local dir_list = {
      documents = home .. "/notes/neorg/documents",
      index = home .. "/notes/neorg/index",
      templates = home .. "/notes/neorg/templates",
    }
    for _, v in pairs(dir_list) do
      if not exists(v) then
        vim.fn.jobstart({ "mkdir", "-p", v }, {
          on_exit = function()
            vim.notify("Create directory in Neorg workspace(notes): ", v)
          end,
        })
      end
    end
  end

  local setup_template_file = function()
    local templates_dir = vim.fn.stdpath("config") .. "/templates/norg/"
    local template_list = {
      journal = home .. "/notes/neorg/templates/journal.norg",
      design_document = home .. "/notes/neorg/templates/design_document.norg",
      cornell_method = home .. "/notes/neorg/templates/cornell_method.norg",
      index = home .. "/notes/neorg/templates/index.norg",
    }
    for k, v in pairs(template_list) do
      if not exists(v) then
        vim.fn.jobstart({ "cp", "-n", templates_dir .. k .. "_sample.norg", v })
      end
    end
  end

  local clean_template_file = function()
    local dir = vim.fn.expand("$HOME") .. "/notes/neorg/templates"
    vim.fn.jobstart({ "rm", "-rf", dir })
  end

  setup_directory()
  setup_template_file()

  vim.api.nvim_create_user_command("CleanNeorgTemplates", function()
    clean_template_file()
  end, {})
end

local create_file = function(workspace, directory, opts)
  return function()
    local prompt = "[" .. workspace .. ":" .. directory .. "] File name"
    vim.ui.input({ prompt = prompt }, function(input)
      require("neorg").modules.get_module("core.dirman").create_file(directory .. "/" .. input, workspace, opts)
    end)
  end
end

return {
  "nvim-neorg/neorg",
  build = { ":Neorg sync-parsers" },
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
      ["core.export"] = {
        config = {
          export_dir = "export",
        },
      },
      ["core.export.markdown"] = {
        config = {
          extensions = "all",
        },
      },
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
              return ls.text_node(s.parse_date(1, s.file_tree_date(), [[%Y/%m/%d]]))
            end,
          },
        },
      },
    },
  },
  config = function(_, opts)
    require("neorg").setup(opts)
    setup()
  end,
  dependencies = {
    { "nvim-neorg/neorg-telescope", dependencies = "nvim-lua/plenary.nvim" },
    { "pysan3/neorg-templates", dependencies = "L3MON4D3/LuaSnip" },
  },
  ft = "norg",
  cmd = "Neorg",
  keys = {
    -- journal
    -- { "<Leader>ot", "<Cmd>Neorg journal toc open<CR>", mode = { "n" } },
    { "<Leader>on", "<Cmd>Neorg journal tomorrow<CR>", mode = { "n" } },
    { "<Leader>op", "<Cmd>Neorg journal yesterday<CR>", mode = { "n" } },
    { "<Leader>oj", "<Cmd>Neorg journal today<CR>", mode = { "n" } },
    -- neorg-templates
    { "<Leader>otj", "<Cmd>Neorg templates fload journal<CR>", mode = { "n" } },
    { "<Leader>otd", "<Cmd>Neorg templates fload design_document<CR>", mode = { "n" } },
    { "<Leader>otc", "<Cmd>Neorg templates fload cornell_method<CR>", mode = { "n" } },
    { "<Leader>oti", "<Cmd>Neorg templates fload index<CR>", mode = { "n" } },
    -- dirman
    { "<Leader>oed", create_file("notes", "documents", { no_open = false, force = false }), mode = { "n" } },
    { "<Leader>oei", create_file("notes", "index", { no_open = false, force = false }), mode = { "n" } },
    -- other
    -- { "<Leader>oe", "<Cmd>Neorg export directory neorg markdown<CR>", mode = { "n" } },
    { "<Leader>oi", "<Cmd>Neorg index<CR>", mode = { "n" } },
    { "<Leader>om", "<Cmd>Neorg inject-metadata<CR>", mode = { "n" } },
    -- for Telescope
    { "<Leader>of", "<Cmd>Telescope neorg find_norg_files<CR>", mode = { "n" } },
    { "<Leader>ob", "<Cmd>Telescope neorg find_backlinks<CR>", mode = { "n" } },
    { "<Leader>olf", "<Cmd>Telescope neorg insert_file_link<CR>", mode = { "n" } },
    { "<Leader>olh", "<Cmd>Telescope neorg insert_link<CR>", mode = { "n" } },
  },
  enabled = true,
}
