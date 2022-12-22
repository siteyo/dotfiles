local status, noice = pcall(require, "noice")
if not status then
  return
end

noice.setup({
  messages = {
    enable = true,
    view = "mini",
  },
})
