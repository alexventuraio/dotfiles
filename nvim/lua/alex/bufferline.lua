local status_ok, bufferline = pcall(require, 'bufferline')
if not status_ok then
  return
end

bufferline.setup({
  options = {
    mode = 'tabs',
    indicator = {
      style = 'underline',
    },
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = 'NvimTree',
        text = 'פּ',
        text_align = 'center',
        separator = true,
      }
    },
    show_tab_indicators = true,
    separator_style = 'slant',
  }
})
