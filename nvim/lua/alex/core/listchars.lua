-- Show special characteres
--
--
-- https://vi.stackexchange.com/a/37971/31190 | https://stackoverflow.com/a/73842509
-- vim.opt.listchars = { lead = '·', space = '_', tab = '▶‒', nbsp = '·', trail = '∙', extends = '▶', precedes = '◀', eol = '¶' }
vim.opt.listchars = { lead = '·', tab = '▸─', nbsp = '␣', trail = '•', extends = '»', precedes = '«', eol = '¬' }
vim.opt.list = true


-- Highlight special characteres
--
--
-- (https://stackoverflow.com/a/69805673/4111295)
vim.cmd([[ highlight NonText guifg=#4a4a59 ctermfg=white ]])                                      -- applies to: eol, extends and precedes
vim.cmd('highlight NonBreakingSpaces guifg=#ffffff guibg=#ff005f ctermfg=black ctermbg=yellow')   -- applies to: nbsp, tab and trail
vim.cmd('highlight TrailingWhitespace guifg=#000000 guibg=#ffff00 ctermfg=black ctermbg=yellow')  -- applies to: nbsp, tab and trail
vim.w.m1 = vim.fn.matchadd('NonBreakingSpaces', "\\%u00a0")                                       -- match both non-breaking spaces...
vim.w.m1 = vim.fn.matchadd('TrailingWhitespace', "[[:blank:]]\\+$")                               -- ... and trailing white-space

-- vim.highlight.create('ColorColumn', {ctermbg=0, guibg=lightgrey}, false)
