local util = require("config.util")
local uv = vim.uv or vim.loop

-- Open Finder App
---@return nil
local open_finder = function()
  vim.fn.jobstart({ "open", vim.fn.expand("%:h") }, {
    on_exit = function()
      Snacks.notify("Open Finder")
    end,
  })
end

-- Move Command
---@param arg string
---@return string
local file_dest = function(arg)
  local dst = vim.fn.expand(arg)
  local tail = vim.fn.expand("%:t")
  if dst:match("[/\\]$") then
    dst = dst .. tail
  elseif vim.fn.isdirectory(dst) == 1 then
    dst = dst .. "/" .. tail
  end
  return (dst:gsub("^%./", ""))
end

---@param arg string
---@param bang boolean
---@return nil
local move = function(arg, bang)
  local src = vim.api.nvim_buf_get_name(0)
  local dst = file_dest(arg)

  local dir = vim.fn.fnamemodify(dst, ":h")
  if vim.fn.isdirectory(dir) == 0 and vim.fn.mkdir(dir, "p") == 0 then
    return util.error('Failed to create directory "' .. dir .. '"')
  end
  dst = vim.fn.simplify(dst)

  if not bang and uv.fs_stat(dst) then
    return util.error("File exists (add ! to override): " .. dst)
  end

  if vim.fn.filereadable(src) == 1 then
    local ok, e = uv.fs_rename(src, dst)
    if not ok then
      return util.error(('Failed to rename "%s" to "%s": %s'):format(src, dst, e))
    end
  end

  local last_bufnr = vim.fn.bufnr("$")
  vim.cmd("silent keepalt file " .. vim.fn.fnameescape(dst))
  if vim.fn.bufnr("$") ~= last_bufnr then
    vim.cmd(vim.fn.bufnr("$") .. "bwipe")
  end

  vim.bo.modified = true
  vim.cmd("write!")
  vim.cmd("filetype detect")
end

-- for macOS
if vim.fn.has("mac") then
  -- Open Finder
  vim.api.nvim_create_user_command("OpenFinder", open_finder, {})

  -- Move
  vim.api.nvim_create_user_command("Move", function(opts)
    move(opts.args, opts.bang)
  end, { nargs = 1, bang = true, bar = true, complete = "file" })
end
