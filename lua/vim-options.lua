vim.cmd("set expandtab")
vim.cmd("set tabstop=2")
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")


vim.opt.splitbelow = true                          -- force all horizontal splits to go below current window
vim.opt.splitright = true                          -- force all vertical splits to go to the right of current window
vim.opt.cursorline = true                          -- highlight the current line
vim.opt.cursorcolumn = true                        -- highlight cursor line underneath the cursor vertically.


vim.g.mapleader = ' '

-- Navigate vim panes better
vim.keymap.set('n', '<c-k>', ':wincmd k<CR>')
vim.keymap.set('n', '<c-j>', ':wincmd j<CR>')
vim.keymap.set('n', '<c-h>', ':wincmd h<CR>')
vim.keymap.set('n', '<c-l>', ':wincmd l<CR>')

vim.wo.number = true
