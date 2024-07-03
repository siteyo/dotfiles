local M = {
  "3rd/image.nvim",
  event = "VeryLazy",
  config = function()
    package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
    package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
    require("image").setup({
      integrations = {
        neorg = {
          enabled = true,
          clear_in_insert_mode = false,
          download_remote_images = true,
          only_render_image_at_cursor = true,
          filetypes = { "norg" },
        },
      },
    })
  end,
  rocks = {
    "magick",
  },
  build = false,
}

return M
