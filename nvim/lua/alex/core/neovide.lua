-- Put anything you want to happen only in Neovide here
if vim.g.neovide then
  local opts = { noremap = true, silent = true, expr = false }

  -- Save file with Cmd+s
  vim.keymap.set('n', '<D-s>', ':w<CR>', opts)
  vim.keymap.set('i', '<D-s>', '<Esc>:w<CR>', opts)

  -- Save All files with SHIFT+Cmd+s
  vim.keymap.set('n', '<D-S>', ':wa<CR>', opts)
  vim.keymap.set('i', '<D-S>', '<Esc>:wa<CR>', opts)

  -- Open a new tab with Cmd
  vim.keymap.set('', '<D-T>', '<Esc>:tabnew<CR>', opts)

  -- TAB in normal mode it will move to next buffer | SHIFT-TAB will go back
  -- vim.keymap.set('n', '<TAB>', ':bnext<CR>', opts)
  -- vim.keymap.set('n', '<S-TAB>', ':bprevious<CR>', opts)
  vim.keymap.set('n', '<D-{>', ':tabprevious<CR>', opts)
  vim.keymap.set('n', '<D-}>', ':tabnext<CR>', opts)

  -- To interprets Alt + whatever as <M-whatever>
  vim.g.neovide_input_macos_alt_is_meta = true

  -- Disable cursor animation
  vim.g.neovide_cursor_animation_length = 0             -- 'railgun'

  -- Set whether the app should take up the entire screen
  -- vim.g.neovide_fullscreen = true

  -- Remember Previous Window Size
  vim.g.neovide_remember_window_size = true

  -- Dynamically Change The Scale At Runtime | https://neovide.dev/faq.html#how-can-i-dynamically-change-the-scale-at-runtime
  -- To increase font-size on the fly | https://neovide.dev/faq.html#how-can-i-dynamically-change-the-scale-at-runtime
  vim.keymap.set('n', '<D-=>', ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor + 0.1<CR>', opts)
  vim.keymap.set('n', '<D-->', ':lua vim.g.neovide_scale_factor = vim.g.neovide_scale_factor - 0.1<CR>', opts)
  vim.keymap.set('n', '<D-0>', ':lua vim.g.neovide_scale_factor = 1<CR>', opts)


  -- Use cmd-c/cmd-v to copy and paste? | https://neovide.dev/faq.html#how-can-i-use-cmd-ccmd-v-to-copy-and-paste
  -- vim.keymap.set('n', '<D-s>', ':w<CR>') -- Save
  -- vim.keymap.set('v', '<D-c>', '"+y') -- Copy
  -- vim.keymap.set('n', '<D-v>', '"+P') -- Paste normal mode
  -- vim.keymap.set('v', '<D-v>', '"+P') -- Paste visual mode
  -- vim.keymap.set('c', '<D-v>', '<C-R>+') -- Paste command mode
  -- vim.keymap.set('i', '<D-v>', '<ESC>l"+Pli') -- Paste insert mode
end

-- Allow clipboard copy paste in neovim
-- vim.api.nvim_set_keymap('', '<D-v>', '+p<CR>', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('!', '<D-v>', '<C-R>+', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('t', '<D-v>', '<C-R>+', { noremap = true, silent = true})
-- vim.api.nvim_set_keymap('v', '<D-v>', '<C-R>+', { noremap = true, silent = true})
