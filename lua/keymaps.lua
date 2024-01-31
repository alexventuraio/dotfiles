-- TAB in normal mode it will move to next buffer | SHIFT-TAB will go back
vim.keymap.set('n', '<TAB>', ':bnext<CR>', {})
vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>', {})
vim.keymap.set('n', '<D-[>', ':tabprevious<CR>', {})
vim.keymap.set('n', '<D-]>', ':tabnext<CR>', {})
