local M = {
  "siteyo/md-tasks.nvim",
  ft = "markdown",
  cmd = { "MdTasks", "MdTaskFiles" },
  keys = {
    {
      "<Leader>mk",
      function()
        require("md-tasks.actions").show_tasks({ "undone", "progress" })
      end,
      mode = { "n" },
      desc = "[MdTasks] Show undone and in-progress tasks",
    },
    {
      "<Leader>ma",
      function()
        require("md-tasks.actions").show_tasks()
      end,
      mode = { "n" },
      desc = "[MdTasks] Show all tasks",
    },
    {
      "<Leader>mf",
      function()
        require("md-tasks.actions").show_task_files({ "undone", "progress" })
      end,
      mode = { "n" },
      desc = "[MdTasks] Show undone and in-progress task files",
    },
    {
      "<Leader>mm",
      function()
        require("md-tasks.actions").show_task_files()
      end,
      mode = { "n" },
      desc = "[MdTasks] Show all task files",
    },
  },
  opts = {
    states = {
      undone = "[ ]",
      progress = "[/]",
      done = "[x]",
      cancel = "[-]",
      forward = "[>]",
      delegate = "[<]",
    },
  },
  dev = false,
}

return M
