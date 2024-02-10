vim.opt.syntax = 'on'

-- Disable Netrw at the very start of your init.lua (strongly advised)
vim.g.loaded_netrw = 1
vim.g.loaded_netrwPlugin = 1

vim.g.neovide_input_macos_alt_is_meta = false      -- https://neovide.dev/configuration.html#macos-alt-is-meta

-- File editing
vim.opt.backup = false                             -- creates a backup file
vim.opt.swapfile = false                           -- creates a swapfile
vim.opt.undofile = true                            -- enable persistent undo
vim.opt.undodir = vim.fn.stdpath('config') .. 'nvim/undodir'

-- Tab / Indentation
vim.opt.tabstop = 2                                -- insert 2 spaces for a tab
vim.opt.shiftwidth = 2                             -- the number of spaces inserted for each indentation
vim.opt.softtabstop = 2                            -- see multiple spaces as tabstops so <BS> does the right thing
vim.opt.expandtab = true                           -- convert tabs to white spaces
vim.opt.smartindent = true                         -- make indenting smarter again
vim.opt.wrap = false                               -- do not wrap lines

-- Search
vim.opt.incsearch = true                           -- highlight next match on searching
vim.opt.ignorecase = true
vim.opt.smartcase = true
vim.opt.hlsearch = true                            -- highlight all matches on previous search pattern

-- Appearance
vim.wo.number = true
-- vim.opt.number = true                              -- set numbered lines
vim.opt.termguicolors = true                       -- set term gui colors (most terminals support this)
vim.opt.colorcolumn = '120'                        -- set a line length marker
vim.opt.signcolumn = 'yes'                         -- always show the sign column, otherwise it would shift the text each time
vim.opt.cursorcolumn = true                        -- highlight cursor line underneath the cursor vertically.
vim.opt.cursorline = true                          -- highlight the current line
vim.opt.scrolloff = 8                              -- start scrolling text before reaching the bottom
vim.opt.sidescrolloff = 8
vim.opt.showmatch = true                           -- show matching brackets
vim.opt.guifont = 'OperatorMonoLig Nerd Font Mono:h16:Regular'  -- the font used in graphical neovim applications (bolder)
-- vim.opt.guifont = 'OperatorMonoSSmLig Nerd Font Mono:h16:Regular'          -- the font used in graphical neovim applications (bolder)

-- Behaviour
vim.opt.errorbells = false                         -- no sound on errors
vim.opt.visualbell = true                          -- use a visual bell instead of beeping
vim.opt.splitright = true                          -- force all vertical splits to go to the right of current window
vim.opt.splitbelow = true                          -- force all horizontal splits to go below current window
vim.opt.iskeyword:append('-')                      -- to take words with '-' as one word for delete or search
vim.opt.isfname:append("@-@")
vim.opt.fileencoding = 'utf-8'                     -- the encoding written to a file
vim.opt.whichwrap:append('<,>,h,l,[,]')            -- to move to the previous/next line using these keys when on the first/last character

-- Stops automatically commenting the next line when pressing Enter on a commented line
-- Automatically insert the current comment leader after hitting <Enter> in Insert mode.
-- https://neovim.discourse.group/t/options-formatoptions-not-working-when-put-in-init-lua/3746/5
-- https://superuser.com/a/271024
-- vim.opt.formatoptions:remove('c')
-- vim.opt.formatoptions:remove('r')
-- vim.opt.formatoptions:remove('o')
