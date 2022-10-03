--
-- GENERAL PLUGINS CONFIG
--

require('Comment').setup()
-- gcc/gbc -> NORMAL mode
-- gc/gb -> VISUAL mode

require("bufferline").setup{}

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
