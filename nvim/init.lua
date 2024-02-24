local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
  vim.fn.system({
    "git",
    "clone",
    "--filter=blob:none",
    "https://github.com/folke/lazy.nvim.git",
    "--branch=stable", -- latest stable release
    lazypath,
  })
end
vim.opt.rtp:prepend(lazypath)

require("vim-options")
require("keymaps")
require("autocmds")
require("neovide")
require("zoom")

require("lazy").setup("plugins")

require("listchars")

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
-- :set guifont? --> to see the value of a variable like vim.g.guifont
