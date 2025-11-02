-- for macOS
if vim.fn.has("mac") then
  vim.api.nvim_create_user_command("OpenFinder", function()
    vim.fn.jobstart({ "open", vim.fn.expand("%:h") }, {
      on_exit = function()
        Snacks.notify("Open Finder")
      end,
    })
  end, {})
end

-- for win
-- if vim.fn.has("wsl") then
--   -- code
-- end
