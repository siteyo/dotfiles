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
  ft = "markdown",
  cmd = "Obsidian",
  keys = {
    { "<Leader>or", "<Cmd>Obsidian rename<CR>", mode = { "n" }, desc = "[Obsidian] Rename Note" },
    { "<Leader>oq", "<Cmd>Obsidian quick_switch<CR>", mode = { "n" }, desc = "[Obsidian] Quick Switch" },
    { "<Leader>oh", "<Cmd>Obsidian quick_switch home<CR>", mode = { "n" }, desc = "[Obsidian] Show Home Note" },
    -- { "<Leader>oi", "<Cmd>Obsidian quick_switch inbox<CR>", mode = { "n" }, desc = "[Obsidian] Show GTD Inbox Note" },
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
    picker = {
      name = "snacks.pick",
    },
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
      folder = "Extras/Templates/obsidian.nvim",
      date_format = "%Y-%m-%d",
      time_format = "%H:%M:%S",
    },
    new_notes_location = "notes_subdir",
    -- wiki_link_func = function(opts)
    --   return require("obsidian.util").wiki_link_path_prefix(opts)
    -- end,
    preferred_link_style = "wiki",
    note_id_func = function(_)
      return tostring(os.date("%Y%m%dT%H%M%S"))
    end,
    note_path_func = function(spec)
      local path = spec.dir / tostring(spec.id)
      return path:with_suffix(".md")
      -- return spec.title
    end,
    frontmatter = {
      enabled = true,
      func = function(note)
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
      sort = { "id", "aliases", "tags" },
    },
    checkbox = {
      order = { " ", "/", "x", "-", ">", "<" },
    },
    ui = {
      enable = false,
    },
    attachments = {
      img_folder = "Extras/Images",
      img_name_func = function()
        return os.date("%Y%m%dT%H%M%S")
      end,
      confirm_img_paste = false,
    },
  },
  config = function(_, opts)
    opts = setup_workspaces(opts)
    setup_autocmd()
    require("obsidian").setup(opts)
  end,
}

return M
