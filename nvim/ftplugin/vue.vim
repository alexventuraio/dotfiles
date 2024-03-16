" To be agle to use `gf` with Vue imports with @ symbol
" FROM: https://stackoverflow.com/q/70574914/4111295
setlocal includeexpr=substitute(v:fname,'^@\/','app/frontend/src/','')
