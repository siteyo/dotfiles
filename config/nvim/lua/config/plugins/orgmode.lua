local template = {}

template.journal = [[
* %<%Y-%m-%d> %<%a>
  %U

** Daily reviews [/]
   - [ ] Check mail.
   - [ ] Check schedule.
   - [ ] Check Slack.
   - [ ] Add tasks to agenda.
]]

template.todo = [[
* TODO %?
  %U
]]

template.plan = [[
* PLAN %?
  SCHEDULED: %^T
  %U
]]

template.document = [[
* %?
  %U

** Cue

** Note

** Summary
]]

template.index = [[
* %?
  %U
]]

template.memo = [[
* %?      :Memo:
  %U
]]

template.note = [[
* %?
  %U
]]

---@param name "journal" | "todo" | "plan" | "document" | "index" | "memo" | "note"
---@return string
template.get = function(name)
  return template[name]
end

return {
  {
    "nvim-orgmode/orgmode",
    lazy = false,
    config = function()
      require("nvim-treesitter.configs").setup({
        highlight = {
          enable = true,
          additional_vim_regex_highlighting = { "org" },
        },
        ensure_installed = { "org" },
      })

      require("orgmode").setup({
        org_agenda_files = { "~/notes/org/agenda/**" },
        org_default_notes_file = "~/notes/org/inbox.org",
        org_archive_location = "~/notes/org/archive/%s_archive::",
        org_todo_keywords = {
          "TODO(t)",
          "NEXT(n)",
          "WAITING(w)",
          "PROJECT(p)",
          "PLAN(l)",
          "SOMEDAY(s)",
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
          PLAN = ":foreground #9ece6a",
          SOMEDAY = ":foreground #7aa2f7",
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
          j = {
            description = "Journal",
            template = template.get("journal"),
            target = "~/notes/org/journal.org",
            datetree = { tree_type = "month" },
          },
          d = {
            description = "Document",
            template = template.get("document"),
            target = "~/notes/org/documents/inbox.org",
          },
          i = {
            description = "Index",
            template = template.get("index"),
            target = "~/notes/org/index/inbox.org",
          },
          m = {
            description = "Memo",
            template = template.get("memo"),
          },
          n = {
            description = "Note",
            template = template.get("note"),
            target = "~/notes/org/notes/inbox.org",
          },
        },
        org_startup_folded = "content",
        -- win_split_mode = { "float", 0.8 },
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
