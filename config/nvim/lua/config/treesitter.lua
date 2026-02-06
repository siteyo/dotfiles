local M = {}
M._installed = nil
M._queries = {}

---@param update boolean?
function M.get_installed(update)
  if update then
    M._installed, M._queries = {}, {}
    for _, lang in ipairs(require("nvim-treesitter").get_installed("parsers")) do
      M._installed[lang] = true
    end
  end
  return M._installed or {}
end

return M
