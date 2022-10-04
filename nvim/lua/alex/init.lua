vim.opt.termguicolors = true

-- NVIM-TREE disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

require('alex.mappings')
require('alex.lsp')
require('alex.nvimtree')
require('alex.telescope')
require('alex.miscellaneous')
