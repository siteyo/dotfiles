local template = {}

template.todo = [[
* TODO %?
  %U
]]

template.plan = [[
* PLAN %?
  SCHEDULED: %^T
  %U
]]

---@param name "todo" | "plan"
---@return string
template.get = function(name)
  return template[name]
end

return {
  {
    "nvim-orgmode/orgmode",
    ft = "org",
    keys = {
      {
        "<Leader>oo",
        function()
          require("orgmode.api.agenda").agenda({ span = "day" })
        end,
        mode = { "n" },
      },
      { "<Leader>oc", mode = "n" },
      { "<Leader>oa", mode = "n" },
    },
    opts = {
      org_agenda_files = { "~/notes/org/agenda/**" },
      org_default_notes_file = "~/notes/org/inbox.org",
      org_archive_location = "~/notes/org/archive/%s_archive::",
      org_deadline_warning_days = 14,
      org_todo_keywords = {
        "TODO(t)",
        "NEXT(n)",
        "WAITING(w)",
        "PROJECT(r)",
        "PLAN(l)",
        "LOG(o)",
        "|",
        "DONE(d)",
        "TRASH(h)",
        "CANCELED(c)",
        "DELEGATED(g)",
      },
      org_todo_keyword_faces = {
        TODO = ":foreground #db4b4b",
        NEXT = ":foreground #e0af68",
        WAITING = ":foreground #ff9e64",
        PROJECT = ":foreground #9d7cd8",
        PLAN = ":foreground #9ece6a",
        LOG = ":foreground #7aa2f7",
        DONE = ":foreground #449dab",
        TRASH = ":foreground #545c7e",
        CANCELED = ":foreground #545c7e",
        DELEGATED = ":foreground #449dab",
      },
      org_capture_templates = {
        t = {
          description = "Todo",
          template = template.get("todo"),
          headline = "Todo",
          target = "~/notes/org/agenda/inbox.org",
        },
        l = {
          description = "Plan",
          template = template.get("plan"),
          headline = "Plan",
          target = "~/notes/org/agenda/inbox.org",
        },
      },
      org_startup_folded = "content",
      org_tags_column = 90,
      -- win_split_mode = { "float", 0.8 },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      require("orgmode").setup(opts)

      local dir = vim.fn.stdpath("data") .. "/orgmode/"
      -- Create dest dir
      if not require("config.util").exists(dir) then
        vim.fn.jobstart({ "mkdir", "-p", dir }, {
          on_exit = function()
            vim.notify("Create directory: ", dir)
          end,
        })
      end

      ---@param org_file OrgApiFile
      local org_to_json = function(org_file)
        local datetime = os.time() + (opts.org_deadline_warning_days * 86400) -- 3600sec/hour * 24h = 86400sec
        local timestamp = os.date(datetime)

        local org_data = { todo = {}, plan = {} }
        for _, headline in ipairs(org_file.headlines) do
          if headline.todo_value then
            local item = {
              title = headline.title,
              todo_value = headline.todo_value,
              todo_type = headline.todo_type,
              scheduled_today = headline.scheduled and headline.scheduled:is_today(),
              scheduled_overdue = headline.scheduled and headline.scheduled:is_past("day"),
              deadline_warning = headline.deadline and (headline.deadline.timestamp - timestamp) < 0,
              deadline_overdue = headline.deadline and headline.deadline:is_past("day"),
              clocked_in = headline._section:is_clocked_in(),
              is_archived = headline.is_archived,
            }
            if item.todo_value == "PLAN" then
              table.insert(org_data.plan, item)
            else
              table.insert(org_data.todo, item)
            end
          end
        end

        local filename = string.match(org_file.filename, "^.*/(.*).org$") .. ".json"
        vim.fn.writefile({ vim.json.encode(org_data) }, dir .. filename)
      end

      ---@param filename string
      local load_org = function(filename)
        local org_file = require("orgmode.api").load(filename)
        org_to_json(org_file)
      end

      local load_all_org = function()
        local org_files = require("orgmode.api").load()
        for _, org_file in ipairs(org_files) do
          org_to_json(org_file)
        end
      end

      local async = require("plenary.async")
      local async_load_org = async.wrap(load_org, 1)
      local async_load_all_org = async.wrap(load_all_org, 0)

      async.void(function()
        async_load_all_org()
      end)()

      local org_json = vim.api.nvim_create_augroup("org_json", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "[^0-9]*.org" },
        group = org_json,
        callback = function(event)
          async.void(function()
            async_load_org(vim.fn.fnamemodify(event.file, ":p"))
          end)()
        end,
      })
    end,
    enabled = true,
  },
  {
    "akinsho/org-bullets.nvim",
    config = true,
    ft = "org",
  },
}
