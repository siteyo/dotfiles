-- Util
local util = require("config.util")

-- Common path
local home = vim.fn.expand("$HOME")
local notes_workspace = home .. "/notes/neorg"
local archives_workspace = home .. "/notes/neorg_archives"
local sandbox_workspace = home .. "/notes/neorg_sandbox"
local templates_sample_dir = vim.fn.stdpath("config") .. "/templates/norg"
local templates_dir = home .. "/notes/neorg_templates"

-- Direcctory setup
local dir_table = {
  encounters = notes_workspace .. "/encounters",
  atlas = notes_workspace .. "/atlas",
  cards = notes_workspace .. "/cards",
  sources = notes_workspace .. "/sources",
  efforts = notes_workspace .. "/efforts",
}
local dir_list = util.get_table_keys(dir_table)

local setup_directory = function()
  for _, v in pairs(dir_table) do
    if not util.exists(v) then
      vim.fn.jobstart({ "mkdir", "-p", v })
    end
  end
end

-- Template setup
local template_list = {}
local setup_templates = function()
  -- Template directory
  vim.fn.jobstart({ "mkdir", "-p", templates_dir })

  -- Template files
  local files = vim.fn.readdir(templates_sample_dir)
  for _, file in pairs(files) do
    local source_file = templates_sample_dir .. "/" .. file
    local destination_file = templates_dir .. "/" .. string.gsub(file, "_sample", "")
    if not util.exists(destination_file) then
      vim.fn.jobstart({ "cp", "-n", source_file, destination_file })
    end
  end

  -- Create template list
  for _, file in pairs(vim.fn.readdir(templates_dir)) do
    local file_noext = file:gsub(".norg", "")
    table.insert(template_list, file_noext)
  end
end

-- Autocmd
local neorg = vim.api.nvim_create_augroup("neorg", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  pattern = "*.norg",
  group = neorg,
  command = "setlocal conceallevel=2",
})

-- Custom create_file function
--- @param workspace string
--- @param directory string
--- @param opts core.dirman.create_file_opts
local create_file = function(workspace, directory, opts)
  local datetime = os.date("%Y%m%d%H%M")
  local prompt = "[" .. workspace .. ":" .. directory .. "] File name"
  local last_dir = vim.fn.chdir(dir_table[directory])
  vim.ui.input({ prompt = prompt, completion = "dir" }, function(input)
    local neorg_create_file = require("neorg").modules.get_module("core.dirman").create_file
    local path = vim.fn.fnamemodify(input, ":h")
    local file = vim.fn.fnamemodify(input, ":t")
    if file == "" then
      neorg_create_file(directory .. "/" .. path .. "/" .. datetime, workspace, opts)
    elseif file ~= "v:null" then
      neorg_create_file(directory .. "/" .. path .. "/" .. file .. "__" .. datetime, workspace, opts)
    end
    vim.fn.chdir(last_dir)
  end)
end

-- Insert file link
local insert_file_reference = function()
  vim.ui.select(dir_list, { prompt = "Select directory" }, function(directory)
    if not directory then
      return
    end

    local last_dir = vim.fn.chdir(dir_table[directory])

    vim.ui.input({ prompt = "Input filename (without extension)", completion = "dir" }, function(filename)
      if not filename or filename == "" then
        vim.fn.chdir(last_dir)
        return
      end

      vim.ui.input({ prompt = "Input title" }, function(title)
        vim.fn.chdir(last_dir)
        if not title or title == "" then
          return
        end

        local link = string.format("{:$/%s/%s:}[%s]", directory, filename, title)
        vim.api.nvim_put({ link }, "c", true, true)
      end)
    end)
  end)
end

return {
  "nvim-neorg/neorg",
  -- build = { ":Neorg sync-parsers" },
  opts = {
    load = {
      ["core.defaults"] = {}, -- Loads default behaviour
      ["core.concealer"] = {}, -- Adds pretty icons to your documents
      ["core.summary"] = {},
      ["core.journal"] = {
        config = {
          journal_folder = "calendar",
          strategy = "flat",
        },
      },
      ["core.dirman"] = { -- Manages Neorg workspaces
        config = {
          workspaces = {
            notes = notes_workspace,
            archives = archives_workspace,
            sandbox = sandbox_workspace,
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
          templates_dir = { vim.fn.expand("$HOME") .. "/notes/neorg_templates" },
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
            TITLE_NODATE = function()
              local ls = require("luasnip")
              local s = require("neorg.modules.external.templates.default_snippets")
              local title = s.file_title():gsub("__%d+", "")
              return ls.text_node(title)
            end,
          },
        },
      },
    },
  },
  config = function(_, opts)
    setup_directory()
    setup_templates()
    require("neorg").setup(opts)
  end,
  dependencies = {
    { "nvim-neorg/neorg-telescope", dependencies = "nvim-lua/plenary.nvim" },
    { "pysan3/neorg-templates", dependencies = "L3MON4D3/LuaSnip" },
  },
  ft = "norg",
  cmd = "Neorg",
  build = false,
  keys = {
    -- journal
    -- { "<Leader>ot", "<Cmd>Neorg journal toc open<CR>", mode = { "n" } },
    { "<Leader>on", "<Cmd>Neorg journal tomorrow<CR>", mode = { "n" }, desc = "Show tomorrow journal" },
    { "<Leader>op", "<Cmd>Neorg journal yesterday<CR>", mode = { "n" }, desc = "Show yesterday journal" },
    { "<Leader>oj", "<Cmd>Neorg journal today<CR>", mode = { "n" }, desc = "Show today journal" },
    -- neorg-templates
    {
      "<Leader>ot",
      function()
        vim.ui.select(template_list, { prompt = "Select template" }, function(choice)
          if choice then
            vim.cmd("Neorg templates fload " .. choice)
          end
        end)
      end,
      mode = { "n" },
      desc = "Load template",
    },
    -- dirman
    {
      "<Leader>oe",
      function()
        vim.ui.select(dir_list, { prompt = "Select directory" }, function(choice)
          if choice then
            create_file("notes", choice, { no_open = false, force = false })
          end
        end)
      end,
      mode = { "n" },
      desc = "Create New Neorg File",
    },
    -- other
    -- { "<Leader>oe", "<Cmd>Neorg export directory neorg markdown<CR>", mode = { "n" } },
    { "<Leader>oh", "<Cmd>Neorg index<CR>", mode = { "n" }, desc = "Show Index" },
    { "<Leader>oi", "<Cmd>Neorg inject-metadata<CR>", mode = { "n" }, desc = "Inject Metadata" },
    { "<Leader>ou", "<Cmd>Neorg update-metadata<CR>", mode = { "n" }, desc = "Update Metadata" },
    -- for Telescope
    { "<Leader>of", "<Cmd>Telescope neorg find_norg_files<CR>", mode = { "n" }, desc = "Find Neorg Files" },
    { "<Leader>ob", "<Cmd>Telescope neorg find_backlinks<CR>", mode = { "n" }, desc = "Find Backlinks" },
    { "<Leader>ol", "<Cmd>Telescope neorg find_linkable<CR>", mode = { "n" }, desc = "Find Neorg Headings" },
    {
      "<C-l>",
      function()
        vim.ui.select({ "heading", "file", "reference" }, { prompt = "Insert link" }, function(choice)
          if choice == "file" then
            vim.cmd("Telescope neorg insert_file_link")
          elseif choice == "heading" then
            vim.cmd("Telescope neorg insert_link")
          elseif choice == "reference" then
            insert_file_reference()
          end
        end)
      end,
      mode = { "i" },
      desc = "Insert file/heading link",
    },
  },
  enabled = true,
}
