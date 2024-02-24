-- Set up nvim-cmp.
local cmp = require('cmp')

--   פּ ﯟ   some other good icons
local kind_icons = {
  Text = '',         -- Text = '',          Text = '',
  Method = '',       -- Method = '',        Method = 'm',
  Function = '',     -- Function = '',      Function = '',
  Constructor = '',  -- Constructor = '',   Constructor = '',
  Field = '',        -- Field = '',         Field = '',
  Variable = '',     -- Variable = '',      Variable = '',
  Class = 'ﴯ',        -- Class = '',         Class = '',
  Interface = '',    -- Interface = '',     Interface = '',
  Module = '',       -- Module = '',        Module = '',
  Property = 'ﰠ',     -- Property = '',      Property = '',
  Unit = '',         -- Unit = '',          Unit = '',
  Value = '',        -- Value = '',         Value = '',
  Enum = '',         -- Enum = '',          Enum = '',
  Keyword = '',      -- Keyword = '',       Keyword = '',
  Snippet = '',      -- Snippet = '',       Snippet = '',
  Color = '',        -- Color = '',         Color = '',
  File = '',         -- File = '',          File = '',
  Reference = '',    -- Reference = '',     Reference = '',
  Folder = '',       -- Folder = '',        Folder = '',
  EnumMember = '',   -- EnumMember = '',    EnumMember = '',
  Constant = '',     -- Constant = '',      Constant = '',
  Struct = '',       -- Struct = '',        Struct = '',
  Event = '',        -- Event = '',         Event = '',
  Operator = '',     -- Operator = '',      Operator = '',
  TypeParameter = '' -- TypeParameter = '', TypeParameter = '',
}
-- find more here: https://www.nerdfonts.com/cheat-sheet

cmp.setup({
  formatting = {
    fields = { 'kind', 'abbr', 'menu' },
    format = function(entry, vim_item)
      -- Kind icons
      vim_item.kind = string.format('%s', kind_icons[vim_item.kind])
      -- vim_item.kind = string.format('%s %s', kind_icons[vim_item.kind], vim_item.kind) -- This concatonates the icons with the name of the item kind
      -- Source
      vim_item.menu = ({
        nvim_lsp = '[LSP]',
        nvim_lua = '[NVIM_LUA]',
        luasnip = '[Snippet]',
        buffer = '[Buffer]',
        path = '[Path]',
      })[entry.source.name]
      return vim_item
    end,
  },
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn['UltiSnips#Anon'](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    documentation = cmp.config.window.bordered(),
  },
  mapping = cmp.mapping.preset.insert({
    ['<C-b>'] = cmp.mapping.scroll_docs(-4),
    ['<C-f>'] = cmp.mapping.scroll_docs(4),
    ['<C-Space>'] = cmp.mapping.complete(),
    ['<C-e>'] = cmp.mapping.abort(),
    ['<CR>'] = cmp.mapping.confirm({
      behavior = cmp.ConfirmBehavior.Replace,
      select = true,
    }), -- Accept currently selected item. Set `select` to `false` to only confirm explicitly selected items.
  }),
  sources = cmp.config.sources({
    { name = 'nvim_lsp' },
    { name = 'ultisnips' }, -- For ultisnips users.
  }, {
    { name = 'buffer' },
  }),
})

-- Set configuration for specific filetype.
cmp.setup.filetype('gitcommit', {
  sources = cmp.config.sources({
    { name = 'cmp_git' }, -- You can specify the `cmp_git` source if you were installed it.
  }, {
    { name = 'buffer' },
  })
})

-- Use buffer source for `/` (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline('/', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = {
    { name = 'buffer' }
  }
})

-- Use cmdline & path source for ':' (if you enabled `native_menu`, this won't work anymore).
cmp.setup.cmdline(':', {
  mapping = cmp.mapping.preset.cmdline(),
  sources = cmp.config.sources({
    { name = 'path' }
  }, {
    { name = 'cmdline' }
  })
})

-- Set up lspconfig.
-- ...continue at the bottom of the lsp.lua file...
