local status, neogit = pcall(require, "neogit")
if not status then return end

neogit.setup({
  kind = "split_above",
  mappings = {
    status = {
      ["s"] = "",
    },
  },
})

vim.keymap.set("n", "[Git]s", "<Cmd>Neogit kind=split_above<CR>")
vim.keymap.set("n", "[Git]c", "<Cmd>Neogit commit<CR>")
vim.keymap.set("n", "[Git]h", "<Cmd>Neogit branch<CR>")
