call plug#begin('~/.config/nvim/plugged')
  """"" LSP
  Plug 'neovim/nvim-lspconfig'             " Collection of configurations for built-in LSP client

  """"" For better languages syntax highlighting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  """"" Telescope
  Plug 'nvim-lua/plenary.nvim'
  Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.0' }

  """"" IDE
  Plug 'numToStr/Comment.nvim'
  Plug 'akinsho/bufferline.nvim', { 'tag': 'v2.*' }
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'windwp/nvim-autopairs'
  Plug 'norcalli/nvim-colorizer.lua'
  Plug 'nvim-tree/nvim-tree.lua'
  Plug 'wakatime/vim-wakatime'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-rhubarb'                 " required by fugitive to :Gbrowse
  Plug 'airblade/vim-gitgutter'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'SirVer/ultisnips'

  """"" THEMES
  Plug 'marko-cerovac/material.nvim'
  Plug 'nvim-tree/nvim-web-devicons'      " To have icons in your statusline and files

  """"" AUTOCOMPLETE
  Plug 'hrsh7th/cmp-nvim-lsp'              " LSP source for nvim-cmp
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'                  " Autocompletion plugin
  " For ultisnips users.
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'

  """"" Ruby & Rails
  " Plug 'slim-template/vim-slim'
  " Plug 'kchmck/vim-coffee-script'
  Plug 'tpope/vim-bundler'
  " Plug 'tpope/vim-endwise'
  Plug 'tpope/vim-rails'
  Plug 'vim-ruby/vim-ruby'

  """"" HTML & Javascript & React
  Plug 'mattn/emmet-vim'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()



""""" AUTOCOMPLETE Config
"  set completeopt=menu,menuone,noselect


""""" My LUA namespace Custom Config
lua require('alex')

" MAPPINGS --------------------------------------------------------------- {{{

""""" Mappings code goes here.

""""" Move between splitted windows by holding CTRL + hjkl
nnoremap <C-h> <C-w>h
nnoremap <C-j> <C-w>j
nnoremap <C-k> <C-w>k
nnoremap <C-l> <C-w>l

""""" Move 1 more lines up or down in normal and visual selection modes.
nnoremap K :m .-2<CR>==
nnoremap J :m .+1<CR>==
vnoremap K :m '<-2<CR>gv=gv
vnoremap J :m '>+1<CR>gv=gv

""""" fugitive.vim mappings GIT
nmap <leader>gb :Git blame<CR>
nmap <leader>gs :Git<CR>
nmap <leader>gd :Git diff<CR>
nmap <leader>gl :Git log<CR>
nmap <leader>gc :Git commit<CR>
nmap <leader>gp :Git push<CR>
autocmd FileType fugitiveblame nmap <buffer> q gq

""""" Clear highlights on hitting 'ESC' twice
nnoremap <esc><esc> :noh<return>

""""" Emmet trigger key
let g:user_emmet_mode='n'                        " only enable normal mode functions.
let g:user_emmet_leader_key=';'                  " leader key for emmet (;,)

""""" Fix indentation in file
map <Leader>i mmgg=G`m<CR>

""""" Copy to clipboard
vnoremap <leader>y "+y
nnoremap <leader>Y "+yg_
nnoremap <leader>y "+y

""""" Paste from clipboard
nnoremap <leader>p "+p
nnoremap <leader>P "+P
vnoremap <leader>p "+p
vnoremap <leader>P "+P

""""" Override beginning and end of line navigation
nnoremap H 0
nnoremap L $


""""" This command toggles the material theme style
nnoremap <leader>tt :lua require('material.functions').toggle_style()<CR>

" }}}


" VIMSCRIPT -------------------------------------------------------------- {{{

""""" This will enable code folding.
""""" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END

""""" Strip trailing whitespace on save
autocmd BufWritePre * :%s/\s\+$//e

""""" Auto-resize splits when Vim gets resized.
autocmd VimResized * wincmd =

" }}}


" STATUS LINE ------------------------------------------------------------ {{{


" }}}


" THEMING ---------------------------------------------------------------- {{{

""""" Theme config for: material.nvim
let g:material_style = "darker"
colorscheme material



""""" Show and highlight special characteres (https://stackoverflow.com/a/69805673/4111295)
"set list listchars=tab:▶‒,nbsp:∙,trail:∙,extends:▶,precedes:◀,eol:¶
set list listchars=tab:▸─,nbsp:␣,trail:·,extends:»,precedes:«,eol:¬
highlight NonText guifg=#4a4a59                    " applies to: eol, extends and precedes
highlight SpecialKey guifg=white guibg=#ff005f     " applies to: nbsp, tab and trail
call matchadd('SpecialKey', '\%u00a0')             " match both non-breaking spaces...
call matchadd('SpecialKey', '[[:blank:]]\+$')      " ... and trailing white-space

" }}}







""""" FIX: E319: No 'python3' provider found. Run ':checkhealth provider'
" https://github.com/neoclide/coc-snippets/issues/196#issuecomment-781231190
" https://www.reddit.com/r/neovim/comments/pdzxzp/e319_no_python3_provider_found_run_checkhealth/
"let g:python3_host_prog = '/opt/homebrew/bin/python3'

""""" UltiSnips config
" Define a directory where my snippets were to be located: https://stackoverflow.com/a/37514464/4111295
let g:UltiSnipsSnippetDirectories=["~/Dropbox/Code/dotfiles/vim/UltiSnips"]
" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
"let g:UltiSnipsExpandTrigger='<Leader><Leader>'
let g:UltiSnipsExpandTrigger='<tab>'
" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit='vertical'

""""" To be agle to use gf with Vue imports with @ symbol https://stackoverflow.com/q/70574914/4111295
setlocal isfname+=@-@
setlocal includeexpr=substitute(v:fname,'^@\/','app/frontend/src/','')
set suffixesadd=.js,.vue,.scss,.json







if exists("g:neovide")                           " Put anything you want to happen only in Neovide here
  set guifont=Operator\ Mono\ Lig\ Book:h16

  """"" To interprets Alt + whatever as <M-whatever>
  let g:neovide_input_macos_alt_is_meta = v:true

  """"" TAB in normal mode it will move to next buffer | SHIFT-TAB will go back
  nnoremap <silent> <TAB> :bnext<CR>
  nnoremap <silent> <S-TAB> :bprevious<CR>
  nnoremap <silent> <S-D-[> :tabprevious<CR>
  nnoremap <silent> <S-D-]> :tabnext<CR>

  """"" Save file with Cmd+s
  nmap <D-s> :w<CR>
  imap <D-s> <ESC>:w<CR>

  """"" Copy-Paste with Cmd-v Cmd-c Cmd-x
  vnoremap <special> <D-x> "+x

  vnoremap <special> <D-c> "+y
  cnoremap <special> <D-c> <C-Y>

  nnoremap <special> <D-v> "+gP
  cnoremap <special> <D-v> <C-R>+
  execute 'vnoremap <script> <special> <D-v>' paste#paste_cmd['v']
  execute 'inoremap <script> <special> <D-v>' paste#paste_cmd['i']

  """"" Open a new tab with Cmd
  noremap <S-D-t> <Esc>:tabnew<CR>

  """"" Disable cursor animation
  let g:neovide_cursor_animation_length=0
  "let g:neovide_cursor_vfx_mode = "railgun"
endif
