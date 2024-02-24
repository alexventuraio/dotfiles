" To close the Git Blame window from Fugitive with q
nmap <buffer> q gq

" vim.api.nvim_create_autocmd('FileType', {
"   pattern = { 'fugitiveblame' },
"   callback = function()
"     vim.keymap.set('n', 'q', 'gq')
"   end
" })
" vim.keymap.set('n', 'q', [[gq]], { buffer = 0, nowait = true, noremap=true })
