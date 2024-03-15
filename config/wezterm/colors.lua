local wez = require("wezterm")

local M = {}

local function get_appearance()
  if wez.gui then
    return wez.gui.get_appearance()
  end
  return "Dark"
end

local function scheme_for_appearance(appearance)
  if appearance:find("Dark") then
    return "Tokyo Night"
  else
    return "Tokyo Night Day"
  end
end

local scheme_name = scheme_for_appearance(get_appearance())
M.scheme_name = scheme_name
M.scheme = wez.color.get_builtin_schemes()[scheme_name]

return M
