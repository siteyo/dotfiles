local neogit = require('neogit')
neogit.setup({})

vim.keymap.set('n', '[Git]s', '<Cmd>Neogit kind=split<CR>')
