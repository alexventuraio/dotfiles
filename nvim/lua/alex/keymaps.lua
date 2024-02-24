local opts = { noremap = true, silent = true }

local term_opts = { silent = true }

-- Shorten function name
local keymap = vim.api.nvim_set_keymap

-- Remap space as leader key
keymap('', '<Space>', '<Nop>', opts)
vim.g.mapleader = ' '
vim.g.maplocalleader = ' '

-- Modes
--   normal_mode = 'n',
--   insert_mode = 'i',
--   visual_mode = 'v',
--   visual_block_mode = 'x',
--   term_mode = 't',
--   command_mode = 'c',

-- NORMAL --
-- Better window navigation
keymap('n', '<C-h>', '<C-w>h', opts)
keymap('n', '<C-j>', '<C-w>j', opts)
keymap('n', '<C-k>', '<C-w>k', opts)
keymap('n', '<C-l>', '<C-w>l', opts)

keymap('n', '<leader>e', ':Lex 30<cr>', opts)

-- Resize with arrows
keymap('n', '<C-Up>', ':resize +2<CR>', opts)
keymap('n', '<C-Down>', ':resize -2<CR>', opts)
keymap('n', '<C-Left>', ':vertical resize -2<CR>', opts)
keymap('n', '<C-Right>', ':vertical resize +2<CR>', opts)

-- Navigate buffers
keymap('n', '<S-l>', ':bnext<CR>', opts)
keymap('n', '<S-h>', ':bprevious<CR>', opts)

-- Fugitive.vim mappings for GIT
keymap('n', '<leader>gb', ':Git blame<CR>', opts)
keymap('n', '<leader>gs', ':Git<CR>', opts)
keymap('n', '<leader>gd', ':Git diff<CR>', opts)
keymap('n', '<leader>gl', ':Git log<CR>', opts)
keymap('n', '<leader>gc', ':Git commit<CR>', opts)
keymap('n', '<leader>gp', ':Git push<CR>', opts)

-- Clear highlights on hitting 'ESC' twice
keymap('n', '<esc><esc>', ':noh<return>', opts)

-- This command toggles the material theme style
keymap('n', '<leader>tt', ':lua require("material.functions").toggle_style()<CR>', opts)

-- NvimTree Mappings
keymap('n', '<leader>m', ':NvimTreeToggle<CR>', opts)
keymap('n', '<leader>n', ':NvimTreeFindFile<CR>', opts)
keymap('n', '<leader>r', ':NvimTreeRefresh<CR>', opts)

-- Bufferline Mappings
keymap('n', '<leader>bb', ':BufferLinePick<CR>', opts)



-- VISUAL --
-- Stay in indent mode
keymap('v', '<', '<gv', opts)
keymap('v', '>', '>gv', opts)

-- Move text up and down
keymap('v', '<A-j>', ':m .+1<CR>==', opts)
keymap('v', '<A-k>', ':m .-2<CR>==', opts)
keymap("v", "p", '"_dP', opts)



-- VISUAL BLOCK --
-- Replace double quotes with single quotes
keymap("x", "<leader>f", ":s/\"/'/g<CR>", opts)

-- Move text up and down
keymap("x", "J", ":move '>+1<CR>gv-gv", opts)
keymap("x", "K", ":move '<-2<CR>gv-gv", opts)
keymap("x", "<A-j>", ":move '>+1<CR>gv-gv", opts)
keymap("x", "<A-k>", ":move '<-2<CR>gv-gv", opts)

-- TERMINAL --
-- Better terminal navigation
keymap('t', '<C-h>', '<C-\\><C-N><C-w>h', term_opts)
keymap('t', '<C-j>', '<C-\\><C-N><C-w>j', term_opts)
keymap('t', '<C-k>', '<C-\\><C-N><C-w>k', term_opts)
keymap('t', '<C-l>', '<C-\\><C-N><C-w>l', term_opts)
