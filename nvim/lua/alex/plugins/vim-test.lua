return {
  'vim-test/vim-test',
  config = function()
    -- FROM: https://github.com/vim-test/vim-test?tab=readme-ov-file#strategies
    vim.g['test#strategy'] = 'neovim'
    -- FROM: https://github.com/vim-test/vim-test?tab=readme-ov-file#vim8--neovim-terminal-position
    vim.g['test#neovim#term_position'] = 'horizontal botright 20'
  end,
  keys = {
    { '<leader>t', '<cmd>TestNearest<CR>', desc = 'In a test file runs the test nearest to the cursor, otherwise runs the last nearest test.' },
    { '<leader>T', '<cmd>TestFile<CR>', desc = 'In a test file runs all tests in the current file, otherwise runs the last file tests.' },
  },
}
