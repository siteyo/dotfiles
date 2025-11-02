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

require("config.private").setup()

require("lazy").setup({
  defaults = { lazy = true },
  spec = {
    { import = "config.plugins" },
    { import = "config.cli" },
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
  dev = {
    path = "~/.nvim/dev",
  },
})
