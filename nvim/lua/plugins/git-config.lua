return {
  {
    'tpope/vim-fugitive',
    config = function()
      vim.keymap.set('n', '<leader>gb', ':Git blame<CR>', {})
      vim.keymap.set('n', '<leader>gs', ':Git<CR>', {})
      vim.keymap.set('n', '<leader>gd', ':Git diff<CR>', {})
      vim.keymap.set('n', '<leader>gl', ':Git log<CR>', {})
      vim.keymap.set('n', '<leader>gc', ':Git commit<CR>', {})
      vim.keymap.set('n', '<leader>gp', ':Git push<CR>', {})
      vim.keymap.set('n', '<leader>gw', ':GBrowse<CR>', {})
    end
  },
  {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()

      vim.keymap.set('n', '<leader>gh', ':Gitsigns preview_hunk<CR>', {})
      vim.keymap.set('n', '<leader>gt', ':Gitsigns toggle_current_line_blame<CR>', {})
    end
  }
}
