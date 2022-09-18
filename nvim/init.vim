syntax enable

set encoding=utf-8
set number                   " add line numbers
set relativenumber           " show line numbers relative to the current cursor line
set mouse=a                  " Enable mouse inside terminal NVIM
set showcmd                  " Show partial command you type in the last line of the screen.
set showmatch                " show matching brackets.
set tabstop=2                " number of columns occupied by a tab character
set softtabstop=2            " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=2             " width for autoindents (set sw=2)
set nowrap                   " Do not wrap lines
set scrolloff=8              " Start scrolling text before reaching the bottom



call plug#begin('~/.config/nvim/plugged')
  """"" LSP
  Plug 'neovim/nvim-lspconfig'

  """"" THEMES
  Plug 'marko-cerovac/material.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'      " To have icons in your statusline

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()



""""" Mappings code goes here.
let mapleader=" "

""""" Material Theme:
colorscheme material
" This command toggles the style
nnoremap <leader>mm :lua require('material.functions').toggle_style()<CR>

""""" LSP Config
lua << END
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'ayu_mirage',
  }
})
END
