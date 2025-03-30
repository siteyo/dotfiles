-- Util
local util = require("config.util")

-- Workspaces
local external_config_sample = vim.fn.stdpath("config") .. "/templates/obsidian/external_config.lua"
local external_config_file = vim.fn.stdpath("data") .. "/obsidian/external_config.lua"
local default_workspace = {
  {
    name = "default_workspace",
    path = vim.fn.expand("$HOME") .. "/notes/obsidian",
  },
}

local setup_workspaces = function(opts)
  local external_config_path = vim.fn.fnamemodify(external_config_file, ":h")
  if not util.exists(external_config_path) then
    vim.system({ "mkdir", "-p", external_config_path })
  end

  if not util.exists(external_config_file) then
    vim.system({ "cp", "-n", external_config_sample, external_config_file })
  end

  local external_config = loadfile(external_config_file)()
  opts.workspaces = #external_config.workspaces == 0 and default_workspace or external_config.workspaces
end

-- Create note
local dir_list = {
  "Encounters",
  "Atlas",
  "Cards",
  "Sources",
  "Efforts",
  "Calendar",
}

local create_note = function()
  local client = require("obsidian").get_client()
  vim.ui.select(dir_list, { prompt = "Select directory" }, function(choice)
    if not choice then
      vim.notify("Aborted")
      return
    end

    local dir = client.dir.filename .. "/" .. choice .. "/"
    if not util.exists(dir) then
      vim.system({ "mdkir", "-p", dir })
    end

    local prompt = "[" .. choice .. "] Enter title or path"
    local last_dir = vim.fn.chdir(dir)
    local title = require("obsidian.util").input(prompt, { completion = "dir" })
    vim.fn.chdir(last_dir)

    if title and vim.fn.fnamemodify(title, ":t") ~= "" then
      local note = client:create_note({ title = title, dir = dir })
      client:open_note(note, { sync = true })
      client:write_note_to_buffer(note)
    else
      vim.notify("Aborted")
    end
  end)
end

-- Autocmd
local obsidian = vim.api.nvim_create_augroup("obdisian", { clear = true })
vim.api.nvim_create_autocmd({ "BufReadPre" }, {
  pattern = "*.md",
  group = obsidian,
  command = "setlocal conceallevel=2",
})

local M = {
  -- "epwalsh/obsidian.nvim"
  "obsidian-nvim/obsidian.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  lazy = false,
  ft = "markdown",
  keys = {
    { "<Leader>or", "<Cmd>ObsidianRename<CR>", mode = { "n" }, "[Obsidian] Rename Note" },
    { "<Leader>oh", "<Cmd>ObsidianQuickSwitch home<CR>", mode = { "n" }, "[Obsidian] Show Home Note" },
    { "<Leader>ob", "<Cmd>ObsidianBacklinks<CR>", mode = { "n" }, "[Obsidian] Find Backlinks" },
    { "<Leader>of", "<Cmd>ObsidianSearch<CR>", mode = { "n" }, "[Obsidian] Search Notes" },
    { "<Leader>oe", create_note, mode = { "n" }, desc = "[Obsidian] Create New Note" },
    { "<Leader>oj", "<Cmd>ObsidianToday<CR>", mode = { "n" }, desc = "[Obsidian] Show Today Calendar Note" },
    { "<Leader>on", "<Cmd>ObsidianTomorrow<CR>", mode = { "n" }, desc = "[Obsidian] Show Tomorrow Calendar Note" },
    { "<Leader>op", "<Cmd>ObsidianYesterday<CR>", mode = { "n" }, desc = "[Obsidian] Show Yesterday Calendar Note" },
  },
  opts = {
    notes_subdir = "Encounters",
    daily_notes = {
      folder = "Calendar",
      default_tags = { "Calendar" },
      template = "calendar.md",
    },
    templates = {
      folder = "Extras/Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
    },
    mappings = {
      ["<C-Space>"] = {
        action = function()
          return require("obsidian").util.toggle_checkbox()
        end,
        opts = { buffer = true },
      },
      ["<CR>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
    },
    follow_url_func = function(url)
      vim.fn.jobstart({ "open", url })
    end,
    new_notes_location = "notes_subdir",
    note_path_func = function(spec)
      return spec.title
    end,
    attachments = {
      img_folder = "Extras/Images",
      img_name_func = function()
        return os.date("%Y%m%dT%H%M%S-")
      end,
    },
  },
  config = function(_, opts)
    setup_workspaces(opts)
    require("obsidian").setup(opts)
  end,
}

return M
