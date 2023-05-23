return {
  {
    "nvim-orgmode/orgmode",
    lazy = false,
    config = function()
      -- Load custom treesitter grammar for org filetype
      require("orgmode").setup_ts_grammar()

      -- Treesitter configuration
      require("nvim-treesitter.configs").setup({
        -- If TS highlights are not enabled at all, or disabled via `disable` prop,
        -- highlighting will fallback to default Vim syntax highlighting
        highlight = {
          enable = true,
          -- Required for spellcheck, some LaTex highlights and
          -- code block highlights that do not have ts grammar
          additional_vim_regex_highlighting = { "org" },
        },
        ensure_installed = { "org" }, -- Or run :TSUpdate org
      })

      require("orgmode").setup({
        org_agenda_files = { "~/notes/org/**" },
        org_default_notes_file = "~/notes/org/inbox.org",
        org_todo_keywords = {
          "TODO(t)",
          "NEXT(n)",
          "WAITING(w)",
          "PROJECT(p)",
          "PLAN(l)",
          "|",
          "DONE(d)",
          "TRASH(r)",
          "CANCELED(c)",
          "DELEGATED(g)",
        },
        org_todo_keyword_faces = {
          TODO = ":foreground #db4b4b",
          NEXT = ":foreground #e0af68",
          WAITING = ":foreground #ff9e64",
          PROJECT = ":foreground #9d7cd8",
          PLAN = ":foreground #c0caf5",
          TRASH = ":foreground #545c7e",
          CANCELED = ":foreground #545c7e",
        },
        org_capture_templates = {
          t = "Todo",
          ti = {
            description = "Inbox",
            template = "* TODO %?\n %u",
            target = "~/notes/org/inbox.org",
            headline = "Todo",
          },
          tp = {
            description = "Project",
            template = "* TODO %?\n %u",
            target = "~/notes/org/project.org",
            headline = "Todo",
          },
          l = "Plan",
          li = {
            description = "Inbox",
            template = "* PLAN %?\n %u",
            target = "~/notes/org/inbox.org",
            headline = "Plan",
          },
          lp = {
            description = "Project",
            template = "* PLAN %?\n %u",
            target = "~/notes/org/project.org",
            headline = "Plan",
          },
          s = "Starter",
          si = {
            description = "Inbox template",
            template = "* Todo\n\n* Plan",
            target = "~/notes/org/inbox.org",
          },
          sp = {
            description = "Project template",
            template = "* Todo\n\n* Plan",
            target = "~/notes/org/project.org",
          },
        },
      })
    end,
    enabled = true,
  },
  {
    "akinsho/org-bullets.nvim",
    config = true,
    lazy = false,
  },
}
