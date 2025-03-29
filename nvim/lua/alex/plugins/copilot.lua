return {
  'github/copilot.vim',
  event = { 'BufReadPre', 'BufNewFile' },
  config = function()
    local handle = io.popen('nvm which default')

    if not handle then -- Check if handle is nil
      vim.notify('GitHub Copilot: Failed to find Node.js path', vim.log.levels.WARN)

      return
    end

    local node_path = handle:read('*a'):gsub('\n', '')
    handle:close()

    if node_path and node_path ~= '' then
      vim.g.copilot_node_command = node_path
    else
      vim.notify('GitHub Copilot: Node.js path not found', vim.log.levels.WARN)
    end

    -- vim.keymap.set('i', '<C-h>', '<Plug>(copilot-previous)') -- Alt - [
    -- vim.keymap.set('i', '<C-l>', '<Plug>(copilot-next)')     -- Alt - ]
    -- vim.keymap.set('i', '<C-j>', '<Plug>(copilot-suggest)')  -- Alt - \
  end,
}
