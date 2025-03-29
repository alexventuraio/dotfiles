return {
  'github/copilot.vim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    vim.g.copilot_node_command = '/Users/alex/.nvm/versions/node/v23.10.0/bin/node'

    -- vim.keymap.set('i', '<C-h>', '<Plug>(copilot-previous)') -- Alt - [
    -- vim.keymap.set('i', '<C-l>', '<Plug>(copilot-next)')     -- Alt - ]
    -- vim.keymap.set('i', '<C-j>', '<Plug>(copilot-suggest)')  -- Alt - \
  end,
}
