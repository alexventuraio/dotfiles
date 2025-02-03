return {
  'github/copilot.vim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    -- vim.keymap.set('i', '<C-h>', '<Plug>(copilot-previous)')
    -- vim.keymap.set('i', '<C-l>', '<Plug>(copilot-next)')
    -- vim.keymap.set('i', '<C-j>', '<Plug>(copilot-suggest)')
  end,
}
