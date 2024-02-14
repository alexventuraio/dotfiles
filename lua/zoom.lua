vim.g.window_is_zoomed = 0

-- FROM: https://stackoverflow.com/a/69142336
local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function zoomWindowToggle()
  if vim.g.window_is_zoomed == 1 then
    vim.cmd(t('normal <C-w>='))

    vim.g.window_is_zoomed = 0

    print('ZoomOut')
  else
    vim.cmd(t('normal <C-w>|'))
    vim.cmd(t('normal <C-w>_'))

    vim.g.window_is_zoomed = 1

    print('ZoomIn')
  end
end

vim.keymap.set('n', '<leader>d', zoomWindowToggle, {noremap=true})