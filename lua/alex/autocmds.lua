local cmd = vim.cmd

-- Highlight on yank
cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Refresh current buffer on focus gain
--  Reload Buffers on focus https://github.com/neovim/neovim/issues/20082#issuecomment-1288228566
cmd [[
  autocmd FocusGained * checktime
]]

-- Auto-resize splits when Vim gets resized.
cmd [[
  autocmd VimResized * wincmd =
]]

-- Strip trailing whitespace on save
cmd [[
  autocmd BufWritePre * :%s/\s\+$//e
]]
