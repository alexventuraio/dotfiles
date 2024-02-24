--
-- GENERAL PLUGINS CONFIG
--

require('nvim-autopairs').setup {}

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
    diagnostics = 'nvim_lsp',
    offsets = {
      {
        filetype = "NvimTree",
        text = "פּ",
        text_align = "center",
        separator = true,
      }
    },
    show_tab_indicators = true,
    separator_style = 'slant',
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
  },

  -- Indentation based on treesitter for the = operator. NOTE: This is an experimental feature.
  indent = {
    enable = true
  },

  refactor = {
    highlight_definitions = { enable = true },
  }
})

require('nvim-web-devicons').setup({
  -- globally enable different highlight colors per icon (default to true)
  -- if set to false all icons will have the default icon's color
  color_icons = true;
  -- globally enable default icons (default to false)
  -- will get overriden by `get_icons` option
  default = true;
})

--
-- GENERAL PLUGINS CONFIG
--
