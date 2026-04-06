-- FROM: https://dotfiles.substack.com/i/193173279/9-diagnostics-changes
local severity = vim.diagnostic.severity

vim.diagnostic.config({
  virtual_text = false, -- disable virtual text
  update_in_insert = true,
  underline = true,
  severity_sort = true,
  float = {
    focusable = true,
    style = 'minimal',
    border = 'rounded',
    source = true,
    -- header = '',
    -- prefix = '',
  },
  signs = {
    text = {
      [severity.ERROR] = '',
      [severity.WARN]  = '',
      [severity.INFO]  = '',
      [severity.HINT]  = '󰠠',
    },
  },
})

-- Global mappings.
-- See `:help vim.diagnostic.*` for documentation on any of the below functions
-- FROM: https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#suggested-configuration
-- FROM: https://github.com/folke/lazy.nvim/discussions/2017#discussioncomment-13743459
vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
vim.keymap.set('n', '[d', function() vim.diagnostic.jump({ count = -1, float = true }) end, { desc = 'diagnostic goto_prev' })
vim.keymap.set('n', ']d', function() vim.diagnostic.jump({ count = 1, float = true }) end, { desc = 'diagnostic goto_next' })
vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
vim.keymap.set('n', '<space>Q', vim.diagnostic.setqflist)
