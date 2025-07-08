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

-- Autocmd
local setup_autocmd = function()
  local obsidian = vim.api.nvim_create_augroup("obdisian", { clear = true })
  vim.api.nvim_create_autocmd({ "BufReadPre" }, {
    pattern = "*.md",
    group = obsidian,
    command = "setlocal conceallevel=2",
  })

  local update_link = function(action)
    local with = require("plenary.context_manager").with
    local open = require("plenary.context_manager").open
    local Path = require("plenary.path")

    local client = require("obsidian").get_client()
    local workspace_path = Path:new(client.dir.filename)
    local new_path = action.dest_url:gsub("^oil://", "")
    local new_link = Path:new(new_path):make_relative(workspace_path.filename)
    local old_path = action.src_url:gsub("^oil://", "")
    local old_link = Path:new(old_path):make_relative(workspace_path.filename)

    vim.system({ "rg", "-l", old_link, workspace_path.filename }, {}, function(obj)
      if obj.stdout == "" then
        vim.notify("[Obsidian] No link updates.")
        return
      end
      for target in obj.stdout:gmatch("[^\n]+") do
        local content
        with(open(target, "r"), function(reader)
          content = reader:read("*a")
        end)
        local replaced_content =
          content:gsub("%[%[" .. util.escape(old_link) .. "%|(.-)%]%]", "[[" .. util.escape(new_link) .. "|%1]]")
        with(open(target, "w"), function(writer)
          writer:write(replaced_content)
        end)
        vim.notify("[Obsidian] Update links")
      end
    end)
  end
  vim.api.nvim_create_autocmd("User", {
    pattern = "OilActionsPost",
    callback = function(args)
      if args.data.err then
        vim.print("ERROR", args.data.err)
        return
      end
      for _, action in ipairs(args.data.actions) do
        if action.type == "move" then
          update_link(action)
        end
      end
    end,
  })

  vim.api.nvim_create_autocmd("User", {
    pattern = "ObsidianNoteEnter",
    callback = function(args)
      vim.keymap.set("n", "<C-Space>", "<Cmd>Obsidian toggle_checkbox<CR>", {
        buffer = args.buf,
        desc = "[Obsidian] Toggle checkbox",
      })
    end,
  })
  vim.api.nvim_create_autocmd("User", {
    pattern = "ObsidianNoteEnter",
    callback = function(args)
      vim.keymap.set("n", "<CR>", "<Cmd>Obsidian follow_link<CR>", {
        buffer = args.buf,
        desc = "[Obsidian] Follow link",
      })
    end,
  })
  vim.api.nvim_create_autocmd("User", {
    pattern = "ObsidianNoteEnter",
    callback = function(args)
      vim.keymap.set("n", "<Leader><CR>", require("obsidian.builtin").smart_action, {
        expr = true,
        buffer = args.buf,
        desc = "[Obsidian] Smart action",
      })
    end,
  })
end

local M = {
  -- "epwalsh/obsidian.nvim"
  "obsidian-nvim/obsidian.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ft = "markdown",
  cmd = "Obsidian",
  keys = {
    { "<Leader>or", "<Cmd>Obsidian rename<CR>", mode = { "n" }, desc = "[Obsidian] Rename Note" },
    { "<Leader>oh", "<Cmd>Obsidian quick_switch home<CR>", mode = { "n" }, desc = "[Obsidian] Show Home Note" },
    { "<Leader>ob", "<Cmd>Obsidian backlinks<CR>", mode = { "n" }, desc = "[Obsidian] Find Backlinks" },
    { "<Leader>oe", "<Cmd>Obsidian new_from_template<CR>", mode = { "n" }, desc = "[Obsidian] Create New Note" },
    { "<Leader>oj", "<Cmd>Obsidian today<CR>", mode = { "n" }, desc = "[Obsidian] Show Today Calendar Note" },
    { "<Leader>on", "<Cmd>Obsidian tomorrow<CR>", mode = { "n" }, desc = "[Obsidian] Show Tomorrow Calendar Note" },
    { "<Leader>op", "<Cmd>Obsidian yesterday<CR>", mode = { "n" }, desc = "[Obsidian] Show Tomorrow Calendar Note" },
    { "<Leader>ov", "<Cmd>Obsidian paste_img<CR>", mode = { "n" }, desc = "[Obsidian] Paste Image" },
    { "<Leader>of", "<Cmd>Obsidian links<CR>", mode = { "n" }, desc = "[Obsidian] Find Forwardlinks" },
    { "<Leader>ot", "<Cmd>Obsidian tags<CR>", mode = { "n" }, desc = "[Obsidian] Find Tags" },
    { "<Leader>om", "<Cmd>Obsidian template<CR>", mode = { "n" }, desc = "[Obsidian] Insert Template" },
    { "<Leader>oo", "<Cmd>Obsidian open<CR>", mode = { "n" }, desc = "[Obsidian] Open Obsidian App" },
    { "<Leader>os", "<Cmd>Obsidian search<CR>", mode = { "n" }, desc = "[Obsidian] Search" },
  },
  opts = {
    legacy_commands = false,
    notes_subdir = "Inbox",
    daily_notes = {
      folder = "Calendar",
      default_tags = { "Calendar" },
      template = "calendar.md",
    },
    completion = {
      nvim_cmp = true,
      create_new = true,
    },
    templates = {
      folder = "Extras/Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
    },
    follow_url_func = function(url)
      vim.fn.jobstart({ "open", url })
    end,
    new_notes_location = "notes_subdir",
    wiki_link_func = function(opts)
      return require("obsidian.util").wiki_link_path_prefix(opts)
    end,
    preferred_link_style = "wiki",
    note_id_func = function(_)
      return tostring(os.date("%Y%m%dT%H%M%S"))
    end,
    note_path_func = function(spec)
      local path = spec.dir / tostring(spec.id)
      return path:with_suffix(".md")
      -- return spec.title
    end,
    note_frontmatter_func = function(note)
      if note.title then
        note:add_alias(note.title)
      end

      if not note.created_at then
        note.created_at = os.date("%Y-%m-%d")
      end

      local out = {
        title = note.title,
        aliases = note.aliases,
        tags = note.tags,
        created_at = note.created_at,
      }

      if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
        for k, v in pairs(note.metadata) do
          out[k] = v
        end
      end

      return out
    end,
    checkbox = {
      order = { " ", "/", "x", "-", ">", "<" },
    },
    ui = {
      enable = false,
    },
    attachments = {
      img_folder = "Extras/Images",
      img_name_func = function()
        return os.date("%Y%m%dT%H%M%S-")
      end,
    },
  },
  config = function(_, opts)
    setup_workspaces(opts)
    setup_autocmd()
    require("obsidian").setup(opts)
  end,
}

return M
