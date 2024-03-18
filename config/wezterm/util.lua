local M = {}

---@param icon string
---@param string string
---@return string
M.cat_icon = function(icon, string)
  return " " .. icon .. " " .. string .. " "
end

return M
