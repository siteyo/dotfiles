local util = require("config.util")

local M = {}

M.config = {
  filepath = vim.fn.stdpath("data") .. "/private.lua",
  template = [[
local M = {}

return M
]],
}

M.private = {}

M.setup = function()
  local private_config_path = vim.fn.fnamemodify(M.config.filepath, ":h")

  -- Ensure the directory for the private configuration file exists, creating it if necessary.
  if not util.exists(private_config_path) then
    vim.system({ "mkdir", "-p", private_config_path })
  end

  -- If the private configuration file does not exist, create it and populate it with the defined template.
  if not util.exists(M.config.filepath) then
    local file = io.open(M.config.filepath, "w")
    if file then
      file:write(M.config.template)
      file:close()
    end
  end

  local chunk, load_err = loadfile(M.config.filepath)
  if not chunk then
    vim.notify("Error loading private.lua: " .. (load_err or "unknown error"), vim.log.levels.ERROR)
    return
  end

  local ok, private_data = pcall(chunk)
  if not ok then
    vim.notify("Error executing private.lua: " .. tostring(private_data), vim.log.levels.ERROR)
    return
  end

  M.private = private_data or {}
end

---@param plugin string?
M.get = function(plugin)
  return M.private[plugin] or {}
end

---@param plugin string
---@param opts table
M.merge = function(plugin, opts)
  local private_opts = M.get(plugin)
  return vim.tbl_deep_extend("force", opts, private_opts)
end

return M
