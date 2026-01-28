local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "--single-branch",
    "https://github.com/folke/lazy.nvim.git",
    lazypath,
  })
end
vim.opt.runtimepath:prepend(lazypath)

local private = require("config.private")
private.setup()

local opts = {
  defaults = { lazy = true },
  spec = {
    { import = "config.plugins" },
  },
  checker = {
    enabled = true,
    frequency = 10800,
  },
  rtp = {
    disabled_plugins = {
      "gzip",
      "matchit",
      "matchparen",
      "netrwPlugin",
      "tarPlugin",
      "tohtml",
      "tutor",
      "zipPlugin",
    },
  },
  rocks = {
    hererocks = true,
  },
}

opts = private.merge("lazy", opts)

require("lazy").setup(opts)
