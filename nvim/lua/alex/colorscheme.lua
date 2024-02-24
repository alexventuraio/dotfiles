-- local colorscheme = 'nvcode'
local colorscheme = 'tokyonight'

-- Use a protected call so we don't error out on first use and we can handle the error
local status_ok, _ = pcall(vim.cmd, 'colorscheme ' .. colorscheme)
if not status_ok then
  vim.notify('colorscheme ' .. colorscheme .. ' not found!')
  return
end
