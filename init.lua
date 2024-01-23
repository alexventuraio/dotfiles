vim.cmd("set expandtab")
vim.cmd("set tabstop=2" )
vim.cmd("set softtabstop=2")
vim.cmd("set shiftwidth=2")

vim.g.mapleader = ' '

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

require("lazy").setup("plugins")

vim.cmd.colorscheme("tokyonight")

local builtin = require('telescope.builtin')
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

vim.keymap.set('n', '<leader>m', ':Neotree filesystem reveal left<CR>', {})

local configs = require("nvim-treesitter.configs")

configs.setup({
  ensure_installed = {
    'html', 'javascript', 'ruby', 'vue', 'css', 'scss', 'markdown', 'json', 'gitignore', 'dockerfile', 'bash', 'typescript', 'lua', 'vim', 'vimdoc', 'query', 'c'
  },
  sync_install = false,
  highlight = { enable = true },
  indent = { enable = true },
})
