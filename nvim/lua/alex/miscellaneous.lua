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
        filetype = "NvimTree",
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
    theme = 'powerline',
    disabled_filetypes = {'NvimTree'},
    component_separators = { left = '', right = ''},
    section_separators = { left = '', right = ''},
  }
})
  
require('nvim-treesitter.configs').setup({
  -- Automatically install missing parsers when entering buffer
  auto_install = true,

  -- A list of parser names, or "all"
  ensure_installed = {
    'html', 'javascript', 'ruby', 'vue', 'css', 'scss', 'markdown', 'lua', 'json', 'gitignore', 'dockerfile', 'bash', 'vim', 'typescript'
  },

  highlight = {
    enable = true,              -- false will disable the whole extension
    -- disable = { 'c', 'rust' },  -- list of language that will be disabled
  },
})

--
-- GENERAL PLUGINS CONFIG
--
