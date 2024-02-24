if vim.g.neovide == true then                           -- Put anything you want to happen only in Neovide here
  local options = { noremap = true, silent = true, expr = false }

  -- Save file with Cmd+s
  vim.keymap.set('n', '<D-s>', ':w<CR>', options)
  vim.keymap.set('i', '<D-s>', '<Esc>:w<CR>', options)

  -- Open a new tab with Cmd
  vim.keymap.set('', '<S-D-t>', '<Esc>:tabnew<CR>', options)

  -- Disable cursor animation
  vim.g.neovide_cursor_animation_length = 0             -- 'railgun'
end
