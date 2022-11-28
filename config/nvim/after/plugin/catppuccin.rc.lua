local status, catppuccin = pcall(require, "catppuccin")
if not status then
  return
end

catppuccin.setup({
  flavour = "mocha",
  transparent_background = false,
  styles = {
    comments = {},
    conditionals = {},
    loops = {},
    functions = {},
    keywords = {},
    strings = {},
    variables = {},
    numbers = {},
    booleans = {},
    properties = {},
    types = {},
    operators = {},
  },
  integrations = {
    cmp = true,
    gitsigns = true,
    nvimtree = true,
    telescope = true,
    treesitter = true,
    mason = true,
    notify = true,
    fidget = true,
    lsp_saga = true,
    native_lsp = {
      enabled = true,
      virtual_text = {
        errors = {},
        hints = {},
        warnings = {},
        information = {},
      },
      underlines = {
        errors = { "underline" },
        hints = { "underline" },
        warnings = { "underline" },
        information = { "underline" },
      },
    },
  },
})

print(Colorscheme)
if Colorscheme == "catppuccin" then
  vim.cmd.colorscheme("catppuccin")
end
