syntax enable

set encoding=utf-8
set number                   " add line numbers
set relativenumber           " show line numbers relative to the current cursor line
set mouse=a                  " enable mouse inside terminal NVIM
set showcmd                  " Show partial command you type in the last line of the screen.
set showmatch                " show matching brackets.
set tabstop=2                " number of columns occupied by a tab character
set softtabstop=2            " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=2             " width for autoindents (set sw=2)
set nowrap                   " do not wrap lines
set scrolloff=8              " start scrolling text before reaching the bottom
set splitbelow               " put the new split below the current one
set splitright               " put the new split to the right of the current one
""""" No sound on errors
set noerrorbells
set visualbell t_vb=
set tm=500



call plug#begin('~/.config/nvim/plugged')
  """"" LSP
  Plug 'neovim/nvim-lspconfig'             " Collection of configurations for built-in LSP client

  """"" For better languages syntax highlighting
  Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}

  """"" Adding FzF
  Plug 'junegunn/fzf', { 'do': { -> fzf#install() } }
  Plug 'junegunn/fzf.vim'

  """"" IDE
  Plug 'preservim/nerdtree'
  Plug 'preservim/nerdcommenter'
  Plug 'wakatime/vim-wakatime'
  Plug 'jiangmiao/auto-pairs'
  Plug 'jlanzarotta/bufexplorer'
  Plug 'tpope/vim-fugitive'
  Plug 'tpope/vim-surround'
  Plug 'tpope/vim-rhubarb'                 " required by fugitive to :Gbrowse
  Plug 'airblade/vim-gitgutter'
  Plug 'ctrlpvim/ctrlp.vim'
  Plug 'terryma/vim-multiple-cursors'
  Plug 'SirVer/ultisnips'
  Plug 'nvim-lualine/lualine.nvim'

  """"" THEMES
  Plug 'marko-cerovac/material.nvim'
  Plug 'kyazdani42/nvim-web-devicons'      " To have icons in your statusline

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
"set completeopt=menu,menuone,noselect

""""" Material Theme:
colorscheme material
""""" This command toggles the style
nnoremap <leader>mm :lua require('material.functions').toggle_style()<CR>

""""" LSP Config
lua << EOF
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'ayu_mirage',
  }
})

require'nvim-treesitter.configs'.setup({
  ensure_installed = { 'javascript', 'ruby', 'vue' },
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { 'c', 'rust' },  -- list of language that will be disabled
  },
})


--
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'solargraph', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- Set up nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' }, -- For ultisnips users.
  }, {
    { name = 'buffer' },
  })
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})
EOF

" MAPPINGS --------------------------------------------------------------- {{{

""""" Mappings code goes here.
let mapleader=' '


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

""""" Shorcut to execute :ClearCtrlPCache
nmap <Leader>C :CtrlPClearCache<cr>              " Refresh just CtrlP
nmap <Leader>r :NERDTreeFocus<cr>R<c-w><c-p>:CtrlPClearCache<cr> " Refresh CtrlP & NERDTree

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

""""" FzF search commands
nmap <leader>fa :Ag<CR>
nmap <leader>fs :FZF<CR>
nmap <leader>rg :Rg<CR>
nmap <leader>fm :Commits<CR>

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

""""" NERDTree config
autocmd StdinReadPre * let s:std_in=1  " This trick also prevents NERDTree from hiding when first selecting a file.
autocmd VimEnter * if argc() == 1 && isdirectory(argv()[0]) && !exists("s:std_in") | exe 'NERDTree' argv()[0] | wincmd p | ene | exe 'cd '.argv()[0] | endif
let NERDTreeShowHidden=1               " Show hidden files by default
nmap <Leader>n :NERDTreeFind<CR>       " Find the current file in the file explorer
nmap <Leader>m :NERDTreeToggle<CR>     " Open/close file explorer

""""" Ignore some folders and files for CtrlP indexing
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\.git$\|\.yardoc\|node_modules\|log\|tmp$',
  \ 'file': '\.so$\|\.dat$|\.DS_Store$|\tags$'
  \ }

""""" To be agle to use gf with Vue imports with @ symbol https://stackoverflow.com/q/70574914/4111295
setlocal isfname+=@-@
setlocal includeexpr=substitute(v:fname,'^@\/','app/frontend/src/','')
set suffixesadd=.js,.vue,.scss,.json







if exists("g:neovide")                           " Put anything you want to happen only in Neovide here
  """"" TAB in normal mode it will move to next buffer | SHIFT-TAB will go back
  nnoremap <silent> <TAB> :bnext<CR>
  nnoremap <silent> <S-TAB> :bprevious<CR>
  nnoremap <silent> <S-D-[> :tabprevious<CR>
  nnoremap <silent> <S-D-]> :tabnext<CR>

  """"" Open NERDTree finder with Cmd+t
  nmap <D-t> :CtrlP<CR>
  imap <D-t> <ESC>:CtrlP<CR>

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
