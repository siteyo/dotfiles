return {
  "ahmedkhalf/project.nvim",
  config = function()
    require("project_nvim").setup({
      manual_mode = false,
      detection_methods = { "pattern" },
      silent_chd = false,
      patterns = {
        ".git",
        "_darcs",
        ".hg",
        ".bzr",
        ".svn",
        "Makefile",
        "package.json",
        ".venv",
      },
    })
  end,
  event = "BufReadPre",
}
