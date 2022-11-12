vim.opt.syntax = 'on'

-- vim.opt.guifont = 'Operator Mono Lig Book:h16'     -- the font used in graphical neovim applications (ligther)
vim.opt.guifont = 'OperatorMonoLig Nerd Font:h16'  -- the font used in graphical neovim applications (bolder)
vim.opt.colorcolumn = '120'                       -- set a line length marker
vim.opt.fileencoding = 'utf-8'                  -- the encoding written to a file
vim.opt.autoread = true
vim.opt.swapfile = false                        -- creates a swapfile
vim.opt.backup = false                          -- creates a backup file
--vim.opt.undodir = vim.fn.stdpath('config') .. 'nvim/undodir'
--vim.opt.undofile = true                         -- enable persistent undo
vim.opt.number = true                           -- set numbered lines
--vim.opt.relativenumber = false                  -- set relative numbered lines
vim.opt.mouse = 'a'                             -- allow the mouse to be used in neovim
vim.opt.showcmd = true                          -- show partial command you type in the last line of the screen
vim.opt.showmatch = true                        -- show matching brackets
vim.opt.tabstop = 2                             -- insert 2 spaces for a tab
vim.opt.expandtab = true                        -- convert tabs to white spaces
vim.opt.softtabstop = 2                         -- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.shiftwidth = 2                          -- the number of spaces inserted for each indentation
vim.opt.wrap = false                            -- do not wrap lines
vim.opt.scrolloff = 8                           -- start scrolling text before reaching the bottom
vim.opt.sidescrolloff = 8
vim.opt.splitbelow = true                       -- force all horizontal splits to go below current window
vim.opt.splitright = true                       -- force all vertical splits to go to the right of current window
vim.opt.cursorline = true                       -- highlight the current line
vim.opt.cursorcolumn = true                     -- highlight cursor line underneath the cursor vertically.
vim.opt.updatetime = 100                        -- faster completion (4000ms default) -- git diff markers refresh time
vim.opt.completeopt = { 'menuone', 'noselect' } -- mostly just for cmp
vim.opt.termguicolors = true                    -- set term gui colors (most terminals support this)
--vim.opt.completeopt='menuone,noinsert,noselect'
vim.opt.hlsearch = true                         -- highlight all matches on previous search pattern
vim.opt.incsearch = true                        -- highlight next match on searching
vim.opt.smartindent = true                      -- make indenting smarter again
vim.opt.signcolumn = 'yes'                      -- always show the sign column, otherwise it would shift the text each time

vim.opt.errorbells = false                      -- no sound on errors
vim.opt.visualbell = true                       -- use a visual bell instead of beeping
--vim.opt.visualbell = 't_vb='
vim.opt.timeoutlen = 1000                       -- time to wait for a mapped sequence to complete (in milliseconds)

vim.opt.iskeyword:append '-'                    -- to take words with '-' as one word for delete or search
vim.cmd "set whichwrap+=<,>,[,],h,l"
vim.cmd [[set formatoptions-=cro]] -- TODO: this doesn't seem to work

-- NVIM-TREE disable netrw at the very start of your init.lua (strongly advised)
vim.g.loaded = 1
vim.g.loaded_netrwPlugin = 1

-- FIX: E319: No 'python3' provider found (for UltiSnips). Run ':checkhealth provider'
-- Must install: python3 -m pip install pynvim
-- https://github.com/neoclide/coc-snippets/issues/196#issuecomment-781231190
-- https://www.reddit.com/r/neovim/comments/pdzxzp/e319_no_python3_provider_found_run_checkhealth/
vim.g.python3_host_prog = '/opt/homebrew/bin/python3'
