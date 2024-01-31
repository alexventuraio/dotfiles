local cmd = vim.cmd

-- Highlight on yank
cmd [[
  augroup YankHighlight
    autocmd!
    autocmd TextYankPost * silent! lua vim.highlight.on_yank()
  augroup end
]]

-- Auto-resize splits when Vim gets resized.
cmd [[
  autocmd VimResized * wincmd =
]]

-- Strip trailing whitespace on save
cmd [[
  autocmd BufWritePre * :%s/\s\+$//e
]]

-- To close the Git Blame window from Fugitive with q
cmd [[
  autocmd FileType fugitiveblame nmap <buffer> q gq
]]
