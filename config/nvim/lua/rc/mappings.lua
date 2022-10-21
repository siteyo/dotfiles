-- Swap : and ;
vim.keymap.set({'n', 'i', 'v'}, ';', ':')
vim.keymap.set({'n', 'i', 'v'}, ':', ';')

-- Window & Tab
vim.keymap.set('n', 's', '<Nop>')
vim.keymap.set('n', 'sh', '<C-w>h')
vim.keymap.set('n', 'sj', '<C-w>j')
vim.keymap.set('n', 'sk', '<C-w>k')
vim.keymap.set('n', 'sl', '<C-w>l')
vim.keymap.set('n', 'sH', '<C-w>H')
vim.keymap.set('n', 'sJ', '<C-w>J')
vim.keymap.set('n', 'sK', '<C-w>K')
vim.keymap.set('n', 'sL', '<C-w>L')
vim.keymap.set('n', 'sn', 'gt')
vim.keymap.set('n', 'sp', 'gT')
vim.keymap.set('n', 'sN', '<Cmd>bn<CR>')
vim.keymap.set('n', 'sP', '<Cmd>bp<CR>')
vim.keymap.set('n', 'st', '<Cmd>tabnew<CR>')
vim.keymap.set('n', 'ss', '<Cmd>sp<CR>')
vim.keymap.set('n', 'sv', '<Cmd>vs<CR>')

-- Quit
vim.keymap.set('n', 'sq', '<Cmd>q<CR>')
vim.keymap.set('n', 'sQ', '<Cmd>q!<CR>')
vim.keymap.set('n', 'sd', '<Cmd>bd<CR>')
vim.keymap.set('n', 'sD', '<Cmd>bd!<CR>')

-- Jump in line
vim.keymap.set('n', '<S-h>', '^')
vim.keymap.set('n', '<S-l>', '$')

-- -- Jump in paragraph
-- vim.keymap.set('n', '<S-j>', '}')
-- vim.keymap.set('n', '<S-k>', '{')

-- Quickfix
vim.keymap.set({'n', 'v'}, 'x', '"_x')

-- ESC alias
vim.keymap.set('i', 'jk', '<ESC>')
vim.keymap.set('i', 'j<Space>', 'j')

-- Jump cursor position
vim.keymap.set('i', '<C-f>', '<Right>')
vim.keymap.set('i', '<C-b>', '<Left>')
vim.keymap.set('i', '<C-e>', '<ESC>A')
vim.keymap.set('i', '<C-a>', '<ESC>I')

-- Operator
vim.keymap.set('o', '[', 'i[')
vim.keymap.set('o', '{', 'i{')

-- Terminal
vim.keymap.set('t', '<C-n><C-n>', '<C-\\><C-n>')
