vim.g.window_is_zoomed = 0

-- FROM: https://stackoverflow.com/a/69142336
local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function zoomWindowToggle()
  if vim.g.window_is_zoomed == 1 then
    print('IF - ' .. vim.g.window_is_zoomed)
    vim.cmd(t('normal <C-w>='))
    vim.g.window_is_zoomed = 0
  else
    print('ELSE - ' .. vim.g.window_is_zoomed)
    vim.cmd(t('normal <C-w>|'))
    vim.cmd(t('normal <C-w>_'))
    vim.g.window_is_zoomed = 1
  end
end

vim.keymap.set('n', '<leader>d', zoomWindowToggle, {noremap=true})