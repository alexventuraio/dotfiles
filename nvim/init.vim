syntax enable

set encoding=utf-8
set number                   " add line numbers
set relativenumber           " show line numbers relative to the current cursor line
set mouse=a                  " Enable mouse inside terminal NVIM
set showcmd                  " Show partial command you type in the last line of the screen.
set showmatch                " show matching brackets.
set tabstop=2                " number of columns occupied by a tab character
set softtabstop=2            " see multiple spaces as tabstops so <BS> does the right thing
set shiftwidth=2             " width for autoindents (set sw=2)
set nowrap                   " Do not wrap lines
set scrolloff=8              " Start scrolling text before reaching the bottom



call plug#begin('~/.config/nvim/plugged')
  """"" LSP
  Plug 'neovim/nvim-lspconfig'             " Collection of configurations for built-in LSP client

  """"" THEMES
  Plug 'marko-cerovac/material.nvim'
  Plug 'nvim-lualine/lualine.nvim'
  Plug 'kyazdani42/nvim-web-devicons'      " To have icons in your statusline

  """"" AUTOCOMPLETE
  Plug 'hrsh7th/cmp-nvim-lsp'              " LSP source for nvim-cmp
  Plug 'hrsh7th/cmp-buffer'
  Plug 'hrsh7th/cmp-path'
  Plug 'hrsh7th/cmp-cmdline'
  Plug 'hrsh7th/nvim-cmp'                  " Autocompletion plugin
  " For ultisnips users.
  Plug 'SirVer/ultisnips'
  Plug 'quangnguyen30192/cmp-nvim-ultisnips'

" Initialize plugin system
" - Automatically executes `filetype plugin indent on` and `syntax enable`.
call plug#end()



""""" Mappings code goes here.
let mapleader=' '

""""" Material Theme:
colorscheme material
""""" This command toggles the style
nnoremap <leader>mm :lua require('material.functions').toggle_style()<CR>

""""" LSP Config
lua << EOF
require('lualine').setup({
  options = {
    icons_enabled = true,
    theme = 'ayu_mirage',
  }
})



--
-- Add additional capabilities supported by nvim-cmp
local capabilities = vim.lsp.protocol.make_client_capabilities()
capabilities = require('cmp_nvim_lsp').update_capabilities(capabilities)

local lspconfig = require('lspconfig')

-- Enable some language servers with the additional completion capabilities offered by nvim-cmp
local servers = { 'solargraph', 'tsserver' }
for _, lsp in ipairs(servers) do
  lspconfig[lsp].setup {
    -- on_attach = my_custom_on_attach,
    capabilities = capabilities,
  }
end

-- Set up nvim-cmp.
local cmp = require 'cmp'

cmp.setup({
  snippet = {
    -- REQUIRED - you must specify a snippet engine
    expand = function(args)
      vim.fn["UltiSnips#Anon"](args.body) -- For `ultisnips` users.
    end,
  },
  window = {
    -- completion = cmp.config.window.bordered(),
    -- documentation = cmp.config.window.bordered(),
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
  })
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
EOF
