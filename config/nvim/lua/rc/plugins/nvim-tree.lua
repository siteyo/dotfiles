require("nvim-tree").setup({
  hijack_cursor = true,
  view = {
    mappings = {
      list = {
        -- Nop
        { key = 'a', action = '' },
        { key = 's', action = '' },
        { key = 'R', action = '' },
        -- my mappings
        { key = 'N', action = 'create' },
        { key = 'h', action = 'close_node' },
        { key = { '<CR>', 'l' }, action = 'edit_in_place' },
        { key = '<C-h>', action = 'dir_up' },
        { key = "r", action = 'rename' },
        { key = "R", action = 'full_rename' },
      }
    },
  },
  filters = {
    dotfiles = true,
  },
  diagnostics = {
    enable = true,
  }
})

local nt_api = require('nvim-tree.api')
local function toggle_replace()
  local view = require('nvim-tree.view')
  if view.is_visible() then
    view.close()
  else
    require('nvim-tree').open_replacing_current_buffer()
  end
end
vim.keymap.set('n', '[Filer]e', toggle_replace)
vim.keymap.set('n', '[Filer]d', function() nt_api.tree.toggle(false, true) end)
