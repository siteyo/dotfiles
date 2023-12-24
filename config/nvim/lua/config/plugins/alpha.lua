local M = {
  "goolord/alpha-nvim",
  lazy = false,
  enabled = false,
}

M.config = function()
  local alpha = require("alpha")
  local startify = require("alpha.themes.startify")
  startify.section.header.val = {
    [[      ███╗░░██╗███████╗░█████╗░██╗░░░██╗██╗███╗░░░███╗██╗░░░██╗░██████╗      ]],
    [[      ████╗░██║██╔════╝██╔══██╗██║░░░██║██║████╗░████║╚██╗░██╔╝██╔════╝      ]],
    [[      ██╔██╗██║█████╗░░██║░░██║╚██╗░██╔╝██║██╔████╔██║░╚████╔╝░╚█████╗░      ]],
    [[      ██║╚████║██╔══╝░░██║░░██║░╚████╔╝░██║██║╚██╔╝██║░░╚██╔╝░░░╚═══██╗      ]],
    [[      ██║░╚███║███████╗╚█████╔╝░░╚██╔╝░░██║██║░╚═╝░██║░░░██║░░░██████╔╝      ]],
    [[      ╚═╝░░╚══╝╚══════╝░╚════╝░░░░╚═╝░░░╚═╝╚═╝░░░░░╚═╝░░░╚═╝░░░╚═════╝░      ]],
  }
  startify.mru_opts.ignore = function(path, ext)
    local default_mru_ignore = { "gitcommit" }
    return (string.find(path, "COMMIT_EDITMSG"))
      or string.find(path, ".mind")
      or (vim.tbl_contains(default_mru_ignore, ext))
  end
  alpha.setup(startify.config)
end

return M
