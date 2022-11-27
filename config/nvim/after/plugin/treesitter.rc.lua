local status, treesitter_config = pcall(require, "nvim-treesitter.configs")
if not status then
  return
end

treesitter_config.setup({
  ensure_installed = { "lua" },
  highlight = {
    enable = true,
  },
  context_commentstring = {
    enable = true,
  },
  autotag = {
    enable = true,
  },
})
