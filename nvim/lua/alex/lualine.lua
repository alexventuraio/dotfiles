local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'powerline',
    disabled_filetypes = { 'NvimTree' },
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  }
})
