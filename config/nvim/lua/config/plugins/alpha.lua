local M = {
  "goolord/alpha-nvim",
  lazy = false,
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
  alpha.setup(startify.config)
end

return M