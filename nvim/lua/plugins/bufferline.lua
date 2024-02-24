return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = 'nvim-tree/nvim-web-devicons',
  config = {
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
  },
}
