local orgmode_enabled = true

return {
  {
    "nvim-orgmode/orgmode",
    ft = "org",
    keys = {
      { "<Leader>oc", mode = "n", desc = "Capture" },
      { "<Leader>oa", mode = "n", desc = "Agenda view" },
    },
    opts = {
      org_agenda_files = { "~/org/agenda/**/*" },
      org_agenda_span = "day",
      org_default_notes_file = "~/org/inbox.org",
      org_archive_location = "~/org/archive/%s_archive::",
      org_deadline_warning_days = 7,
      org_todo_keywords = {
        "TODO(t)",
        "NEXT(n)",
        "WAIT(w)",
        "SOMEDAY(s)",
        "|",
        "DONE(d)",
        "CANCELED(c)",
      },
      org_todo_keyword_faces = {
        TODO = ":foreground #db4b4b",
        NEXT = ":foreground #e0af68",
        WAIT = ":foreground #ff9e64",
        SOMEDAY = ":foreground #9d7cd8",
        DONE = ":foreground #449dab",
        CANCELED = ":foreground #545c7e",
      },
      org_tags_exclude_from_inheritance = { "Project" },
      org_capture_templates = {
        t = {
          description = "Task",
          template = "* TODO %?\n%U",
          target = "~/org/agenda/inbox.org",
        },
        l = {
          description = "Plan",
          template = "* %?\n%^T\n%U\n",
          target = "~/org/agenda/inbox.org",
        },
      },
      org_startup_indented = true,
      org_startup_folded = "content",
      org_tags_column = 90,
      -- win_split_mode = { "float", 0.8 },
      org_agenda_custom_commands = {
        n = {
          description = "Next Actions",
          types = {
            {
              type = "tags_todo",
              match = '+TODO="NEXT"',
              org_agenda_overriding_header = "All",
            },
            {
              type = "tags_todo",
              match = '+TODO="NEXT"',
              org_agenda_overriding_header = "Unscheduled",
              org_agenda_todo_ignore_scheduled = "all",
            },
          },
        },
        r = {
          description = "Review",
          types = {
            {
              type = "tags",
              match = "Project",
              org_agenda_overriding_header = "Projects",
              -- org_agenda_remove_tags = true,
            },
            {
              type = "tags_todo",
              match = '-Project+TODO="TODO"',
              org_agenda_overriding_header = "Todos",
              org_agenda_todo_ignore_scheduled = "past",
              org_agenda_todo_ignore_deadlines = "far",
            },
            {
              type = "tags_todo",
              match = '+TODO="NEXT"',
              org_agenda_overriding_header = "Next Actions",
              org_agenda_todo_ignore_scheduled = "past",
              org_agenda_todo_ignore_deadlines = "far",
            },
            {
              type = "tags_todo",
              match = '+TODO="WAIT"',
              org_agenda_overriding_header = "Waiting for",
            },
          },
        },
        d = {
          description = "Someday",
          types = {
            {
              type = "tags_todo",
              match = '+TODO="SOMEDAY"',
              org_agenda_overriding_header = "Someday",
            },
          },
        },
      },
      ui = {
        input = {
          use_vim_ui = true,
        },
      },
    },
    dependencies = { "nvim-lua/plenary.nvim" },
    config = function(_, opts)
      opts = require("config.private").merge("orgmode", opts)
      require("orgmode").setup(opts)

      local org_json_dir = vim.fn.stdpath("data") .. "/orgmode/"
      -- Create dest dir
      if not require("config.util").exists(org_json_dir) then
        vim.fn.jobstart({ "mkdir", "-p", org_json_dir }, {
          on_exit = function()
            Snacks.notify("Create directory: ", org_json_dir)
          end,
        })
      end

      local export_org_file_to_json = function(parsed_org_file)
        local deadline_threshold = os.time() + (opts.org_deadline_warning_days * 86400) -- 3600sec/hour * 24h = 86400sec
        local deadline_threshold_timestamp = os.date(deadline_threshold)

        local task_data = { todo = {}, plan = {} }
        for _, headline in ipairs(parsed_org_file.headlines) do
          local has_active_date_today = false
          for _, date in ipairs(headline.dates or {}) do
            has_active_date_today = has_active_date_today or date:is_today()
          end

          if headline.todo_value then
            table.insert(task_data.todo, {
              title = headline.title,
              todo_value = headline.todo_value,
              todo_type = headline.todo_type,
              scheduled_today = headline.scheduled and headline.scheduled:is_today(),
              scheduled_overdue = headline.scheduled and headline.scheduled:is_past("day"),
              deadline_warning = headline.deadline and (headline.deadline.timestamp - deadline_threshold_timestamp) < 0,
              deadline_overdue = headline.deadline and headline.deadline:is_past("day"),
              clocked_in = headline._section:is_clocked_in(),
              is_archived = headline.is_archived,
            })
          elseif #(headline.dates or {}) > 0 then
            table.insert(task_data.plan, {
              title = headline.title,
              date_today = has_active_date_today,
              clocked_in = headline._section:is_clocked_in(),
              is_archived = headline.is_archived,
            })
          end
        end

        local json_filename = string.match(parsed_org_file.filename, "^.*/(.*).org$") .. ".json"
        vim.fn.writefile({ vim.json.encode(task_data) }, org_json_dir .. json_filename)
      end

      ---@param org_filename string
      local load_org_file = function(org_filename)
        local parsed_org_file = require("orgmode.api").load(org_filename)
        export_org_file_to_json(parsed_org_file)
      end

      local load_all_org_files = function()
        local org_files = require("orgmode.api").load()
        local expected_json_files = {}
        for _, parsed_org_file in ipairs(org_files) do
          local json_filename = string.match(parsed_org_file.filename, "^.*/(.*).org$") .. ".json"
          expected_json_files[json_filename] = true
          export_org_file_to_json(parsed_org_file)
        end

        for _, json_path in ipairs(vim.fn.globpath(org_json_dir, "*.json", false, true)) do
          local json_filename = vim.fn.fnamemodify(json_path, ":t")
          if not expected_json_files[json_filename] and vim.fn.delete(json_path) ~= 0 then
            vim.notify("Failed to delete stale Org JSON file: " .. json_path, vim.log.levels.WARN)
          end
        end
      end

      local async = require("plenary.async")
      local async_load_org_file = async.wrap(load_org_file, 1)
      local async_load_all_org_files = async.wrap(load_all_org_files, 0)

      async.void(function()
        async_load_all_org_files()
      end)()

      local org_json_augroup = vim.api.nvim_create_augroup("org_json", { clear = true })
      vim.api.nvim_create_autocmd("BufWritePost", {
        pattern = { "[^0-9]*.org" },
        group = org_json_augroup,
        callback = function(event)
          async.void(function()
            async_load_org_file(vim.fn.fnamemodify(event.file, ":p"))
          end)()
        end,
      })
    end,
    enabled = orgmode_enabled,
  },
  {
    "akinsho/org-bullets.nvim",
    config = true,
    ft = "org",
    enabled = false,
  },
}
