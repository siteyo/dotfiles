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
end

local M = {
  -- "epwalsh/obsidian.nvim"
  "obsidian-nvim/obsidian.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  ft = "markdown",
  keys = {
    { "<Leader>or", "<Cmd>ObsidianRename<CR>", mode = { "n" }, desc = "[Obsidian] Rename Note" },
    { "<Leader>oh", "<Cmd>ObsidianQuickSwitch home<CR>", mode = { "n" }, desc = "[Obsidian] Show Home Note" },
    { "<Leader>ob", "<Cmd>ObsidianBacklinks<CR>", mode = { "n" }, desc = "[Obsidian] Find Backlinks" },
    { "<Leader>oe", "<Cmd>ObsidianNewFromTemplate<CR>", mode = { "n" }, desc = "[Obsidian] Create New Note" },
    { "<Leader>oj", "<Cmd>ObsidianToday<CR>", mode = { "n" }, desc = "[Obsidian] Show Today Calendar Note" },
    { "<Leader>on", "<Cmd>ObsidianTomorrow<CR>", mode = { "n" }, desc = "[Obsidian] Show Tomorrow Calendar Note" },
    { "<Leader>op", "<Cmd>ObsidianPasteImg<CR>", mode = { "n" }, desc = "[Obsidian] Paste Image" },
    { "<Leader>of", "<Cmd>ObsidianLinks<CR>", mode = { "n" }, desc = "[Obsidian] Find Forwardlinks" },
    { "<Leader>ot", "<Cmd>ObsidianTags<CR>", mode = { "n" }, desc = "[Obsidian] Find Tags" },
    -- { "<Leader>ot", "<Cmd>ObsidianTemplate<CR>", mode = { "n" }, desc = "[Obsidian] Insert Template" },
    { "<Leader>oo", "<Cmd>ObsidianOpen<CR>", mode = { "n" }, desc = "[Obsidian] Open Obsidian App" },
    { "<Leader>os", "<Cmd>ObsidianSearch<CR>", mode = { "n" }, desc = "[Obsidian] Search" },
    {
      "<C-l>",
      function()
        return vim.ui.select(
          { "tags", "file", "search" },
          { prompt = "Insert tags/file/search result" },
          function(choice)
            if choice == "tags" then
              vim.cmd("ObsidianTags")
            elseif choice == "file" then
              vim.cmd("ObsidianQuickSwitch")
            elseif choice == "search" then
              vim.cmd("ObsidianSearch")
            else
              vim.notify("Aborted")
            end
          end
        )
      end,
      mode = { "i" },
      desc = "[Obsidian] Search and Insert",
    },
  },
  opts = {
    notes_subdir = "Inbox",
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
          return "<Cmd>ObsidianToggleCheckbox<CR>"
        end,
        opts = { buffer = true, expr = true },
      },
      ["<CR>"] = {
        action = function()
          if require("obsidian").util.cursor_on_markdown_link(nil, nil, true) then
            return "<Cmd>ObsidianFollowLink<CR>"
          end
          if require("obsidian").util.cursor_tag(nil, nil) then
            return "<Cmd>ObsidianTags<CR>"
          end
          return "<CR>"
        end,
        opts = { buffer = true, expr = true },
      },
      ["<Leader><CR>"] = {
        action = function()
          return require("obsidian").util.smart_action()
        end,
        opts = { buffer = true, expr = true },
      },
      ["<C-CR>"] = {
        action = function()
          if require("obsidian").util.cursor_on_markdown_link(nil, nil, true) then
            return "<Cmd>ObsidianFollowLink vsplit<CR>"
          else
            return "<C-CR>"
          end
        end,
        opts = { buffer = true, expr = true },
      },
      ["<S-CR>"] = {
        action = function()
          if require("obsidian").util.cursor_on_markdown_link(nil, nil, true) then
            return "<Cmd>ObsidianFollowLink hsplit<CR>"
          else
            return "<S-CR>"
          end
        end,
        opts = { buffer = true, expr = true },
      },
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

      local current_datetime = os.date("%Y-%m-%d %H:%M:%S")
      if not note.created_at then
        note.created_at = current_datetime
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
    ui = {
      checkboxes = {
        [" "] = { order = 1 },
        ["/"] = { order = 2 },
        ["x"] = { order = 3 },
        ["-"] = { order = 4 },
      },
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
