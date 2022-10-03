require('telescope').setup {}

local builtin = require('telescope.builtin')

-- find
vim.keymap.set('n', 'ff', builtin.find_files, {})
vim.keymap.set('n', 'fg', builtin.live_grep, {})
vim.keymap.set('n', 'fs', builtin.grep_string, {})  -- Searches for the string under your cursor in your current working directory
vim.keymap.set('n', 'fb', builtin.buffers, {})
vim.keymap.set('n', 'fh', builtin.help_tags, {})

-- git
vim.keymap.set('n', 'gf', builtin.git_files, {})
vim.keymap.set('n', 'gc', builtin.git_commits, {})
vim.keymap.set('n', 'gt', builtin.git_status, {})

-- theme switcher
vim.keymap.set('n', 'th', builtin.colorscheme, {})
vim.keymap.set('n', 'tk', builtin.keymaps, {})
