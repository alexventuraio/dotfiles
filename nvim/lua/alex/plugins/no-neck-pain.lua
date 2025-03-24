return {
  'shortcuts/no-neck-pain.nvim',
  event = { 'BufReadPre', 'BufNewFile' },
  opts = {
    mappings = {
      -- When `true`, creates all the mappings that are not set to `false`.
      enabled = true,
      -- Sets a global mapping to Neovim, which allows you to toggle the plugin.
      toggle = '<leader>gg',
      -- Sets a global mapping to Neovim, which allows you to toggle the left side buffer.
      -- toggleLeftSide = '<leader>nql',
      -- Sets a global mapping to Neovim, which allows you to toggle the right side buffer.
      -- toggleRightSide = '<leader>nqr',
    },
  },
}
