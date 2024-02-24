return {
  'akinsho/bufferline.nvim',
  version = "*",
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      mode = 'tabs',
      indicator = {
        style = 'underline',
      },
      offsets = {
        {
          filetype = 'NvimTree',
          -- text = 'פּ',
          text = '󱏒 File Explorer',
          text_align = 'center',
          separator = true,
        },
        {
          filetype = 'neo-tree',
          text = '󱋣 File Explorer',
          text_align = 'center',
          separator = true,
        },
      },
      show_tab_indicators = true,
      separator_style = 'slant',
      numbers = 'id',
      diagnostics = 'nvim_lsp',
    },
  },
}
