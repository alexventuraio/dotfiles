return {
  -- {
  --   'p00f/nvim-ts-rainbow',
  -- },
  {
    'nvim-treesitter/nvim-treesitter',
    branch = 'main', -- Critical: use main, not master for Neovim 0.12+ compatibility
    build = ':TSUpdate',
    event = { 'BufReadPre', 'BufNewFile' },
    config = function()
      -- Enable parsers and features manually
      local configs = require('nvim-treesitter.config')

      local ensure_installed_parsers = {
        'c', 'lua', 'vim', 'vimdoc', 'query', 'javascript', 'html', 'ruby', 'vue', 'css', 'scss', 'markdown', 'json', 'gitignore', 'dockerfile', 'bash', 'typescript'
      }

      -- Only install if not already present
      local installed = configs.get_installed()
      local to_install = {}

      for _, lang in ipairs(ensure_installed_parsers) do
        if not vim.tbl_contains(installed, lang) then
          table.insert(to_install, lang)
        end
      end

      if #to_install > 0 then
        require('nvim-treesitter').install(to_install)
      end

      -- Enable highlighting and indentation via FileType autocmd
      vim.api.nvim_create_autocmd('FileType', {
        callback = function(args)
          local lang = vim.treesitter.language.get_lang(args.match)

          if lang and vim.treesitter.get_parser(args.buf, lang, { error = false }) then
            -- Enable treesitter highlighting
            pcall(vim.treesitter.start, args.buf, lang)
            -- Enable treesitter-based indentation
            vim.bo[args.buf].indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
          end
        end,
      })
    end
  },
}
