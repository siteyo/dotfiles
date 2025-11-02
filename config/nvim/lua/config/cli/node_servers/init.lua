local M = {
  name = "node_servers",
  dir = vim.fn.fnamemodify(debug.getinfo(1).source:sub(2), ":h"),
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
}

M.config = function(spec)
  local Path = require("plenary.path")
  local Job = require("plenary.job")

  local dir = spec.dir
  local npm_install_job = Job:new({
    command = "npm",
    args = { "install" },
    cwd = dir,
    on_start = function()
      Snacks.notify("[Node Servers] Installing...")
    end,
    on_exit = function()
      Snacks.notify("[Node Servers] Node Servers have been installed.")
    end,
  })

  local node_modules_dir = Path:new(dir, "node_modules")
  if not node_modules_dir:exists() then
    npm_install_job:start()
  end

  local bin_dir = Path:new(dir, "node_modules", ".bin")
  vim.env.PATH = bin_dir:absolute() .. ":" .. vim.env.PATH

  vim.api.nvim_create_user_command("InstallNodeServer", function()
    npm_install_job:start()
  end, {})
end

return M
