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
