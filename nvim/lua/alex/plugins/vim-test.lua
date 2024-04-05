return {
  'vim-test/vim-test',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    vim.keymap.set('n', '<leader>t', ':TestNearest<CR>')
    vim.keymap.set('n', '<leader>T', ':TestFile<CR>')

    -- FROM: https://github.com/vim-test/vim-test?tab=readme-ov-file#strategies
    vim.g['test#strategy'] = 'neovim'
    -- FROM: https://github.com/vim-test/vim-test?tab=readme-ov-file#vim8--neovim-terminal-position
    vim.g['test#neovim#term_position'] = 'horizontal botright 20'
  end,
}
