local M = {
  "3rd/image.nvim",
  event = "VeryLazy",
  opts = {
    integrations = {
      -- neorg = {
      --   enabled = true,
      --   clear_in_insert_mode = false,
      --   download_remote_images = true,
      --   only_render_image_at_cursor = true,
      --   filetypes = { "norg" },
      -- },
      markdown = {
        enabled = true,
        clear_in_insert_mode = false,
        download_remote_images = true,
        only_render_image_at_cursor = true,
        filetypes = { "markdown" },
        resolve_image_path = function(document_path, image_path, fallback)
          local client = require("obsidian").get_client()
          local working_dir = vim.fn.getcwd()
          if working_dir:find(client.dir.filename) then
            return working_dir .. "/" .. image_path
          end
          return fallback(document_path, image_path)
        end,
      },
    },
  },
  config = function(_, opts)
    -- If you use luarocks, uncomment the following code
    -- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?/init.lua;"
    -- package.path = package.path .. ";" .. vim.fn.expand("$HOME") .. "/.luarocks/share/lua/5.1/?.lua;"
    require("image").setup(opts)
  end,
  -- rocks = {
  --   "magick",
  -- },
  -- build = false,
}

return M
