return {
  -- TODO: experiment with this plugin for Rails development
  -- 'weizheheng/ror.nvim',
  {
    'vim-ruby/vim-ruby',
    event = { 'BufReadPre', 'BufNewFile' },
  },
  {
    'tpope/vim-rails',
    event = { 'BufReadPre', 'BufNewFile' },
  },
}
