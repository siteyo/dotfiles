local group_name = 'vimrc_vimrc'
vim.api.nvim_create_augroup(group_name, { clear = true })

-- vim.api.nvim_create_autocmd({ 'BufWrite' }, {
--   group = group_name,
--   pattern = '*',
--   callback = function()
--     require('notify')('BufWrite ' .. vim.fn.expand('%'))
--   end,
--   once = false,
-- })

