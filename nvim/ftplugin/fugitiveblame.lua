-- To close the Git Blame window from Fugitive with q
-- FROM: https://github.com/tpope/vim-fugitive/issues/1221#issuecomment-2097897596
vim.api.nvim_create_autocmd('FileType', {
  pattern = { 'fugitiveblame', 'fugitive' },
  callback = function()
    -- vim.keymap.set('n', 'q', 'gq', { buffer = 0, silent = true })
    vim.api.nvim_buf_set_keymap(0, 'n', 'q', 'gq', { silent = true })
  end
})
-- vim.keymap.set('n', 'q', [[gq]], { buffer = 0, nowait = true, silent = true })
