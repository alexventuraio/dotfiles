return {
  -- {
  --   'p00f/nvim-ts-rainbow',
  -- },
  {
    'nvim-treesitter/nvim-treesitter',
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function ()
      local treesitter = require('nvim-treesitter.configs')

      treesitter.setup({
        ensure_installed = {
          'c', 'lua', 'vim', 'vimdoc', 'query', 'javascript', 'html', 'ruby', 'vue', 'css', 'scss', 'markdown', 'json', 'gitignore', 'dockerfile', 'bash', 'typescript'
        },
        auto_install = true,
        sync_install = false,
        highlight = { enable = true },
        indent = { enable = true },

        -- rainbow = {
        --   enable = true,
        --   -- disable = { "jsx", "cpp" }, list of languages you want to disable the plugin for
        --   extended_mode = true, -- Also highlight non-bracket delimiters like html tags, boolean or table: lang -> boolean
        --   max_file_lines = nil, -- Do not enable for files with more than n lines, int
        --   -- colors = {}, -- table of hex strings
        --   -- termcolors = {} -- table of colour name strings
        -- },
      })
    end
  },
}
