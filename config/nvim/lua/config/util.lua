local M = {}

M.appearance = function()
  if vim.fn.has("mac") then
    local color = vim.fn.system("defaults read -g AppleInterfaceStyle")
    if string.match(color, ".*Dark.*") then
      return "dark"
    else
      return "light"
    end
  else
    return "dark"
  end
end

return M
