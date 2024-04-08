return {
  'hrsh7th/nvim-cmp',
  event = { 'InsertEnter', 'CmdlineEnter' },
  dependencies = {
    'hrsh7th/cmp-buffer',           -- source for text in buffer
    'hrsh7th/cmp-path',             -- source for file system paths
    'hrsh7th/cmp-cmdline',          -- source for command mode
    'L3MON4D3/LuaSnip',             -- snippet engine
    'saadparwaiz1/cmp_luasnip',     -- for autocompletion
    'rafamadriz/friendly-snippets', -- useful miscellaneous snippets
    'onsails/lspkind.nvim',         -- VSCode like pictograms
  },
  config = function()
    local cmp = require('cmp')

    local luasnip = require('luasnip')

    local lspkind = require('lspkind')

    -- loads vscode style snippets from installed plugins (e.g. friendly-snippets)
    require('luasnip.loaders.from_vscode').lazy_load()

    cmp.setup({
      completion = {
        completeopt = 'menu,menuone,preview,noselect',
      },
      snippet = { -- configure how nvim-cmp interacts with snippet engine
        -- REQUIRED - you must specify a snippet engine
        expand = function(args)
          luasnip.lsp_expand(args.body) -- For `luasnip` users.
        end,
      },
      window = {
        completion = cmp.config.window.bordered(),
        documentation = cmp.config.window.bordered(),
      },
      mapping = cmp.mapping.preset.insert({
        ['<C-k>'] = cmp.mapping.select_prev_item(), -- previous suggestion
        ['<C-j>'] = cmp.mapping.select_next_item(), -- next suggestion
        -- C-b (back) C-f (forward) for snippet placeholder navigation
        ['<C-b>'] = cmp.mapping.scroll_docs(-4),    -- go backwards in the preview window
        ['<C-f>'] = cmp.mapping.scroll_docs(4),     -- go forwards in the preview window
        ['<C-Space>'] = cmp.mapping.complete(),     -- show completion suggestions
        ['<C-e>'] = cmp.mapping.abort(),            -- close completion window
        -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
        ['<CR>'] = cmp.mapping.confirm({ select = false }),
      }),
      -- sources for autocompletion
      sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' }, -- For luasnip users.
        { name = 'buffer' },  -- text within current buffer
        { name = 'path' },    -- file system paths
      }, {
        { name = 'buffer' },
      }),
      -- configure lspkind for vs-code like pictograms in completion menu
      formatting = {
        format = lspkind.cmp_format({
          maxwidth = 50,
          ellipsis_char = '…',
          mode = 'symbol_text',
          menu = ({
            buffer = '[Buffer]',
            nvim_lsp = '[LSP]',
            luasnip = '[LuaSnip]',
            nvim_lua = '[Lua]',
            latex_symbols = '[Latex]',
            path = '[Path]',
          }),
        }),
      },
    })

    -- Set configuration for specific filetype:
    cmp.setup.filetype('gitcommit', {
      sources = cmp.config.sources({
        { name = 'git' }, -- You can specify the `git` source if [you were installed it](https://github.com/petertriho/cmp-git).
      }, {
        { name = 'buffer' },
      })
    })

    -- You can specify the `path` source if [you were installed it](https://github.com/hrsh7th/cmp-cmdline).
    -- Use buffer source for `/` and `?` (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline({ '/', '?' }, {
      mapping = cmp.mapping.preset.cmdline(),
      sources = {
        { name = 'buffer' }
      }
    })

    -- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
    cmp.setup.cmdline(':', {
      mapping = cmp.mapping.preset.cmdline(),
      sources = cmp.config.sources({
        { name = 'path' },
      }, {
        { name = 'cmdline' },
      })
    })
  end,
}
