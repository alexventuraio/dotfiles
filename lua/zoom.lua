-- FROM: https://medium.com/@vinodkri/zooming-vim-window-splits-like-a-pro-d7a9317d40
-- very thanks for the tip, but maybe is better write a tiny vimscript snippet with something like this:
-- nnoremap Z :call ZoomWindowToggle()<cr>
-- let g:window_is_zoomed = 0
-- function! ZoomWindowToggle()
--  if g:window_is_zoomed
--    execute “normal \<c-w>=”
--    let g:window_is_zoomed = 0
--  else
--    execute “normal \<c-w>\|”
--    execute “normal \<c-w>_”
--    let g:window_is_zoomed = 1
--  endif
-- endfunction
-- It is better than remember 2 mappings for one single task.


vim.g.window_is_zoomed = 0

-- FROM: https://stackoverflow.com/a/69142336
local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function zoomWindowToggle()
  if vim.g.window_is_zoomed == 1 then
    print('IF - ' .. vim.g.window_is_zoomed)
    -- execute "<C-w>="
    -- vim.cmd.normal "<C-w>="
    -- vim.cmd([[execute "normal <C-w>="]])
    -- vim.cmd('execute \"normal <c-w>=\"')
    vim.cmd(t('normal <C-w>='))
    vim.g.window_is_zoomed = 0
  else
    print('ELSE - ' .. vim.g.window_is_zoomed)
    -- execute "<C-w>|"
    -- execute "<C-w>_"
    -- vim.cmd.normal "<C-w>|"
    -- vim.cmd.normal "<C-w>_"
    -- vim.cmd([[execute "normal <C-w>|"]])
    -- vim.cmd([[execute "normal <C-w>_"]])
    -- vim.cmd('execute \"normal <c-w>|\"')
    -- vim.cmd('execute \"normal <c-w>_\"')
    vim.cmd(t('normal <C-w>|'))
    vim.cmd(t('normal <C-w>_'))
    vim.g.window_is_zoomed = 1
  end
end

vim.keymap.set('n', '<leader>d', zoomWindowToggle, {noremap=true})