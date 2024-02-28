require('alex.core')
-- require('alex.utils')
require('alex.lazy')
require('alex.core.listchars')

vim.cmd([[
  """"" Copy-Paste with Cmd-v Cmd-c Cmd-x
  vnoremap <special> <D-x> "+x

  vnoremap <special> <D-c> "+y
  cnoremap <special> <D-c> <C-Y>

  nnoremap <special> <D-v> "+gP
  cnoremap <special> <D-v> <C-R>+
  execute 'vnoremap <script> <special> <D-v>' paste#paste_cmd['v']
  execute 'inoremap <script> <special> <D-v>' paste#paste_cmd['i']
]])

-- Debuggin options in Lua:
-- :lua vim.print(vim.opt.whichwrap:get())  --> to see the output of the vim option in cmdline
-- :verb set formatoptions --> to see the last file that modifies formatoptions setting
-- :echo window_is_zoomed --> to see the value of a variable like vim.g.window_is_zoomed
-- :echo &guicursor --> to see the value of a variable like vim.g.window_is_zoomed
-- :set guifont? --> to see the value of a variable like vim.g.guifont
