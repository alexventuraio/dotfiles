""""" My LUA namespace Custom Config
lua require('alex')


" VIMSCRIPT -------------------------------------------------------------- {{{
""""" This will enable code folding.
""""" Use the marker method of folding.
augroup filetype_vim
    autocmd!
    autocmd FileType vim setlocal foldmethod=marker
augroup END
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
  """"" To interprets Alt + whatever as <M-whatever>
  let g:neovide_input_macos_alt_is_meta = v:true

  """"" Copy-Paste with Cmd-v Cmd-c Cmd-x
  vnoremap <special> <D-x> "+x

  vnoremap <special> <D-c> "+y
  cnoremap <special> <D-c> <C-Y>

  nnoremap <special> <D-v> "+gP
  cnoremap <special> <D-v> <C-R>+
  execute 'vnoremap <script> <special> <D-v>' paste#paste_cmd['v']
  execute 'inoremap <script> <special> <D-v>' paste#paste_cmd['i']
endif
