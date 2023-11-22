local M = {
  name = "python_tools",
  dir = vim.fn.fnamemodify(debug.getinfo(1).source:sub(2), ":h"),
  dependencies = { "nvim-lua/plenary.nvim" },
  event = "VeryLazy",
}

M.config = function(spec)
  local Path = require("plenary.path")
  local Job = require("plenary.job")

  local dir = spec.dir
  local rye_sync_job = Job:new({
    command = "rye",
    args = { "sync" },
    cwd = dir,
    on_start = function()
      vim.notify("[Python Tools] Installing...")
    end,
    on_exit = function()
      vim.notify("[Python Tools] Tools have been installed.")
    end,
  })

  local venv_dir = Path:new(dir, ".venv")
  if not venv_dir:exists() then
    rye_sync_job:start()
  end

  local bin_dir = Path:new(dir, ".venv", "bin")
  vim.env.PATH = bin_dir:absolute() .. ":" .. vim.env.PATH

  vim.api.nvim_create_user_command("PTSync", function()
    rye_sync_job:start()
  end, {})
end

return M
