local opts = { noremap = true, silent = true }

-- Remap space as leader key
vim.keymap.set('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '




---------------------------------- NORMAL ----------------------------------------

-- Splits management
vim.keymap.set('n', '<leader>sv', '<C-w>v') -- split window vertically
vim.keymap.set('n', '<leader>sh', '<C-w>s') -- split window horizontally
vim.keymap.set('n', '<leader>se', '<C-w>=') -- make split windows equal width & height
vim.keymap.set('n', '<leader>sx', ':close<CR>') -- close current split window

-- Better window navigation
-- vim.keymap.set('n', '<C-h>', '<C-w>h', opts)
-- vim.keymap.set('n', '<C-j>', '<C-w>j', opts)
-- vim.keymap.set('n', '<C-k>', '<C-w>k', opts)
-- vim.keymap.set('n', '<C-l>', '<C-w>l', opts)
-- Navigate vim panes better
vim.keymap.set('n', '<C-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<C-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<C-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<C-l>', ':wincmd l<CR>')

-- Clear highlights on hitting 'ESC' twice
vim.keymap.set('n', '<esc><esc>', ':noh<return>', opts)

-- Toggle wrap lines on/off
vim.keymap.set('n', '<leader>w', ':lua vim.wo.wrap = not vim.wo.wrap<CR>', opts)

-- Move to the first/last char of the current line
vim.keymap.set({ 'n', 'o', 'x' }, '<S-h>', '^', opts)
vim.keymap.set({ 'n', 'o', 'x' }, '<S-l>', 'g_', opts)

-- Global Substitution of the current word
vim.keymap.set('n', '<leader>su', [[:%s/\<<C-r><C-w>\>/<C-r><C-w>/gI<Left><Left><Left>]])

-- Zoom in/out on a panel without closing any split
vim.keymap.set('n', '<leader>zz', [[<C-w>_ | <C-w>|]], opts) -- the | acts as a command separator
vim.keymap.set('n', '<leader>za', [[<C-w>=]], opts)




---------------------------------- VISUAL ----------------------------------------

-- Stay in indent mode
vim.keymap.set('v', '<', '<gv', opts)
vim.keymap.set('v', '>', '>gv', opts)

-- Move text up and down
vim.keymap.set('v', '<A-j>', ':m .+1<CR>==', opts)
vim.keymap.set('v', '<A-k>', ':m .-2<CR>==', opts)

-- When yank a word and then select other word and paste, keep the original yanked work in the register
vim.keymap.set('v', 'p', '"_dP', opts)




---------------------------------- VISUAL BLOCK ----------------------------------

-- Replace double quotes with single quotes
vim.keymap.set('x', "<leader>'", ":s/\"/'/g<CR>", opts)

-- Move text up and down
vim.keymap.set('x', 'J', ":move '>+1<CR>gv=gv", opts)
vim.keymap.set('x', 'K', ":move '<-2<CR>gv=gv", opts)
vim.keymap.set('x', '<A-j>', ":move '>+1<CR>gv=gv", opts)
vim.keymap.set('x', '<A-k>', ":move '<-2<CR>gv=gv", opts)