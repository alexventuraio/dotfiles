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
  },

  rainbow = {
    enable = true,
    -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
    extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
    max_file_lines = nil, -- Do not enable for files with more than n lines, int
    -- colors = {}, -- table of hex strings
    -- termcolors = {} -- table of colour name strings
  },

  autopairs = {
    enable = true,
  },
})
