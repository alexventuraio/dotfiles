print('From File Type Plugins for Vue file')
-- To be agle to use gf with Vue imports with @ symbol https://stackoverflow.com/q/70574914/4111295
-- setlocal isfname+=@-@
-- setlocal includeexpr=substitute(v:fname,'^@\/','app/frontend/src/','')
-- set suffixesadd=.js,.vue,.scss,.json


-- https://github.com/sam4llis/nvim-lua-gf/blob/main/after/ftplugin/lua.lua
-- vim.opt_local.include = [[\v<((do|load)file|require)[^''"]*[''"]\zs[^''"]+]]
vim.opt_local.isfname:append('@-@')
-- vim.opt_local.isfname = vim.opt_local.isfname + '@-@'
-- vim.opt_local.includeexpr = "substitute(v:fname,'^@\/','app/frontend/src/','g')"
-- vim.opt_local.includeexpr = 'substitute(v:fname,"^@\/","app/frontend/src/","")'
-- vim.opt_local.suffixesadd = '.js,.vue,.scss,.json'
-- vim.opt_local.path:append(path .. '/lua')
-- vim.opt_local.suffixesadd:prepend('.vue')

-- vim.pretty_print(vim.opt.isfname)
-- vim.pretty_print(vim.opt_local.isfname)
-- print(vim.o.isfname)