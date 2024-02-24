-- These funtions are meant to provide with a shortcut to zoom in and out
-- on a panel without closing any of the existing splits

vim.g.window_is_zoomed = 0   -- custom global flag variable

-- FROM: https://stackoverflow.com/a/69142336
local function t(str)
  return vim.api.nvim_replace_termcodes(str, true, true, true)
end

local function toggleSplitZoom()
  if vim.g.window_is_zoomed == 1 then
    vim.cmd.normal(t('<C-w>='))

    vim.g.window_is_zoomed = 0

    print('ZoomOut')
  else
    vim.cmd.normal(t('<C-w>|'))
    vim.cmd.normal(t('<C-w>_'))

    vim.g.window_is_zoomed = 1

    print('ZoomIn')
  end
end

vim.keymap.set('n', '<leader>z', toggleSplitZoom, { noremap=true })
