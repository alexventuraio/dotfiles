return {
  'github/copilot.vim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    -- vim.keymap.set('i', '<C-h>', '<Plug>(copilot-previous)') -- Alt - [
    -- vim.keymap.set('i', '<C-l>', '<Plug>(copilot-next)')     -- Alt - ]
    -- vim.keymap.set('i', '<C-j>', '<Plug>(copilot-suggest)')  -- Alt - \
  end,
}
