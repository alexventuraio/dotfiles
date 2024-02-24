""""" My LUA namespace Custom Config
lua require('alex')

" MAPPINGS --------------------------------------------------------------- {{{
""""" Mappings code goes here.
autocmd FileType fugitiveblame nmap <buffer> q gq

""""" Emmet trigger key
let g:user_emmet_mode='n'                        " only enable normal mode functions.
let g:user_emmet_leader_key=';'                  " leader key for emmet (;,)
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

" Reload Buffers on focus https://github.com/neovim/neovim/issues/20082#issuecomment-1288228566
autocmd FocusGained * checktime
" }}}


""""" Show and highlight special characteres (https://stackoverflow.com/a/69805673/4111295)
"set list listchars=tab:▶‒,nbsp:∙,trail:∙,extends:▶,precedes:◀,eol:¶
set list listchars=tab:▸─,nbsp:␣,trail:·,extends:»,precedes:«,eol:¬
highlight NonText guifg=#4a4a59                    " applies to: eol, extends and precedes
highlight SpecialKey guifg=white guibg=#ff005f     " applies to: nbsp, tab and trail
call matchadd('SpecialKey', '\%u00a0')             " match both non-breaking spaces...
call matchadd('SpecialKey', '[[:blank:]]\+$')      " ... and trailing white-space


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
