local M = {
  name = "node_servers",
  dir = vim.fn.fnamemodify(debug.getinfo(1).source:sub(2), ":h"),
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "BufReadPost",
  build = "npm i",
}

M.config = function(spec)
  local Path = require("plenary.path")
  local dir = spec.dir
  local node_modules_dir = Path:new(dir, "node_modules")
  if not node_modules_dir:exists() then
    vim.fn.system({ "npm", "i", "--prefix", dir })
  end
  local bin_dir = Path:new(dir, "node_modules", ".bin")
  if not bin_dir:exists() then
    bin_dir:mkdir({ parents = true })
  end
  vim.env.PATH = bin_dir:absolute() .. ":" .. vim.env.PATH
end

return M
