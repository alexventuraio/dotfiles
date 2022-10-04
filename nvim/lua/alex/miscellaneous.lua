--
-- GENERAL PLUGINS CONFIG
--

require('colorizer').setup()

require('Comment').setup()
-- gcc/gbc -> NORMAL mode
-- gc/gb -> VISUAL mode

require('bufferline').setup({
  options = {
    mode = 'tabs',
    indicator = {
      style = 'underline',
    },
    offsets = {
      {
        filetype = "nerdtree",
        text = "פּ",
        text_align = "center",
        separator = true,
      }
    },
  }
})

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'ayu_mirage',
    disabled_filetypes = {'NvimTree'}
  }
})
  
require('nvim-treesitter.configs').setup({
  ensure_installed = { 'javascript', 'ruby', 'vue' },
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { 'c', 'rust' },  -- list of language that will be disabled
  },
})

--
-- GENERAL PLUGINS CONFIG
--
