--
-- GENERAL PLUGINS CONFIG
--

require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'ayu_mirage',
    disabled_filetypes = {'NvimTree'}
  }
})
  
require'nvim-treesitter.configs'.setup({
  ensure_installed = { 'javascript', 'ruby', 'vue' },
  highlight = {
    enable = true,              -- false will disable the whole extension
    disable = { 'c', 'rust' },  -- list of language that will be disabled
  },
})

--
-- GENERAL PLUGINS CONFIG
--
