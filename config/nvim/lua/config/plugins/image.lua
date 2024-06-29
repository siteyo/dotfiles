local M = {
  "3rd/image.nvim",
  event = "VeryLazy",
  config = function()
    package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
    package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
    require("image").setup()
  end,
  rocks = {
    "magick",
  },
  build = false,
}

return M
