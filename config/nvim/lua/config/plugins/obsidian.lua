-- Workspaces
local default_workspace = {
  {
    name = "default_workspace",
    path = vim.fn.expand("$HOME") .. "/notes/obsidian",
  },
}

local setup_workspaces = function(opts)
  opts = require("config.private").merge("obsidian", opts)
  opts.workspaces = #opts.workspaces == 0 and default_workspace or opts.workspaces
  return opts
end

-- Autocmd
local setup_autocmd = function()
  local obsidian = vim.api.nvim_create_augroup("obdisian", { clear = true })
  vim.api.nvim_create_autocmd({ "BufReadPre" }, {
    pattern = "*.md",
    group = obsidian,
    command = "setlocal conceallevel=2",
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
end

local M = {
  -- "epwalsh/obsidian.nvim"
  "obsidian-nvim/obsidian.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
  },
  version = "*",
  ft = "markdown",
  cmd = "Obsidian",
  keys = {
    { "<Leader>or", "<Cmd>Obsidian rename<CR>", mode = { "n" }, desc = "[Obsidian] Rename Note" },
    { "<Leader>oq", "<Cmd>Obsidian quick_switch<CR>", mode = { "n" }, desc = "[Obsidian] Quick Switch" },
    { "<Leader>ob", "<Cmd>Obsidian backlinks<CR>", mode = { "n" }, desc = "[Obsidian] Find Backlinks" },
    {
      "<Leader>oe",
      "<Cmd>Obsidian new_from_template<CR>",
      mode = { "n" },
      desc = "[Obsidian] Create New Note From Template",
    },
    { "<Leader>ol", ":Obsidian extract_note<CR>", mode = { "v" }, desc = "[Obsidian] Extract Note" },
    { "<C-l>", "<Cmd>Obsidian link<CR>", mode = { "v" }, desc = "[Obsidian] Insert Link" },
    { "<Leader>oj", "<Cmd>Obsidian today<CR>", mode = { "n" }, desc = "[Obsidian] Show Today Calendar Note" },
    -- { "<Leader>on", "<Cmd>Obsidian tomorrow<CR>", mode = { "n" }, desc = "[Obsidian] Show Tomorrow Calendar Note" },
    { "<Leader>on", "<Cmd>Obsidian new<CR>", mode = { "n" }, desc = "[Obsidian] Create New Note" },
    { "<Leader>op", "<Cmd>Obsidian yesterday<CR>", mode = { "n" }, desc = "[Obsidian] Show Tomorrow Calendar Note" },
    { "<Leader>ov", "<Cmd>Obsidian paste_img<CR>", mode = { "n" }, desc = "[Obsidian] Paste Image" },
    { "<Leader>of", "<Cmd>Obsidian links<CR>", mode = { "n" }, desc = "[Obsidian] Find Forwardlinks" },
    { "<Leader>ot", "<Cmd>Obsidian tags<CR>", mode = { "n" }, desc = "[Obsidian] Find Tags" },
    { "<Leader>om", "<Cmd>Obsidian template<CR>", mode = { "n" }, desc = "[Obsidian] Insert Template" },
    { "<Leader>oo", "<Cmd>Obsidian open<CR>", mode = { "n" }, desc = "[Obsidian] Open Obsidian App" },
    { "<Leader>os", "<Cmd>Obsidian search<CR>", mode = { "n" }, desc = "[Obsidian] Search" },
    { "<Leader>ow", "<Cmd>Obsidian workspace<CR>", mode = { "n" }, desc = "[Obsidian]" },
  },
  opts = {
    legacy_commands = false,
    notes_subdir = "+",
    picker = {
      name = "snacks.pick",
    },
    daily_notes = {
      folder = "Calendar/Notes",
      default_tags = { "calendar/log" },
      template = "Calendar.md",
    },
    completion = {
      blink = false,
      create_new = true,
    },
    templates = {
      folder = "x/Templates",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
      substitutions = {
        name = function(ctx)
          local disp_name = ctx.partial_note:display_name()
          local name = disp_name:gsub("^%d%d%d%d%-%d%d%-%d%d__", "")
          return name
        end,
      },
    },
    new_notes_location = "notes_subdir",
    link = {
      style = "wiki",
      format = "shortest",
    },
    note_id_func = function(title, dir)
      local Path = require("obsidian.path")
      local base_dir = Path.new(dir)
      local candidate = string.gsub(title, "[ :]+", " ")
      local idx = 2
      while (base_dir / candidate):with_suffix(".md", true):exists() do
        candidate = string.format("%s-%d", candidate, idx)
        idx = idx + 1
      end
      return candidate
    end,
    note_path_func = function(spec)
      local path = spec.dir / tostring(spec.id)
      return path:with_suffix(".md")
    end,
    frontmatter = {
      enabled = true,
      func = function(note)
        -- if note.title then
        --   note:add_alias(note.title)
        -- end

        if not note.created then
          note.created = os.date("%Y-%m-%d")
        end

        local out = {
          -- title = note.title,
          aliases = note.aliases,
          tags = note.tags,
          created = note.created,
        }

        if note.metadata ~= nil and not vim.tbl_isempty(note.metadata) then
          for k, v in pairs(note.metadata) do
            out[k] = v
          end
        end

        return out
      end,
      sort = { "up", "aliases", "tags", "created" },
    },
    checkbox = {
      order = { " ", "/", "x", "-", ">", "<" },
    },
    ui = {
      enable = false,
    },
    attachments = {
      folder = "x/Attachments",
      img_name_func = function()
        return string.format("Pasted image %s", os.date("%Y%m%d%H%M%S"))
      end,
      confirm_img_paste = false,
    },
  },
  config = function(_, opts)
    opts = setup_workspaces(opts)
    setup_autocmd()
    require("obsidian").setup(opts)
  end,
  enabled = true,
}

return M
