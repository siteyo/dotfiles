------------------------------------------------------------
--- util.lua
------------------------------------------------------------
local M = {}

-- Get appearance mode
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

-- Determine if the directory exists
--- @param name string
M.exists = function(name)
  local f = io.open(name, "r")
  if f ~= nil then
    io.close(f)
    return true
  else
    return false
  end
end

-- Set submode mapping
---@param mode string | string[]
---@param lhs string
---@param repeat_key string
---@param rhs string | function
---@param opts? vim.keymap.set.Opts
M.map_submode = function(mode, lhs, repeat_key, rhs, opts)
  local plug_name = ""
  if type(mode) == "string" then
    plug_name = "<Plug>(" .. lhs .. mode .. ")"
  else
    plug_name = "<Plug>(" .. lhs .. ")"
  end
  vim.keymap.set(mode, lhs, rhs .. plug_name, opts)
  vim.keymap.set(mode, plug_name .. repeat_key, rhs .. plug_name)
end

-- Toggle option
---@param option string
---@param silent boolean?
---@param values? {[1]:any, [2]:any}
M.toggle = function(option, silent, values)
  if values then
    if vim.opt_local[option]:get() == values[1] then
      vim.opt_local[option] = values[2]
    else
      vim.opt_local[option] = values[1]
    end
    vim.notify("Set " .. option .. " to " .. vim.opt_local[option]:get())
    return
  end
  vim.opt_local[option] = not vim.opt_local[option]:get()
  if not silent then
    if vim.opt_local[option]:get() then
      vim.notify("Enabled " .. option)
    else
      vim.notify("Disabled " .. option)
    end
  end
end

-- Check file type
---@param filepath string
---@return boolean
M.is_binary_file = function(filepath)
  local handle = io.popen("file --mime " .. filepath)
  if handle then
    local result = handle:read("*a")
    handle:close()
    return string.match(result, "charset=binary") ~= nil
  end
  return false
end

-- Get table keys
---@param t table
---@return table
M.get_table_keys = function(t)
  local keys = {}
  for key, _ in pairs(t) do
    table.insert(keys, key)
  end
  return keys
end

return M
