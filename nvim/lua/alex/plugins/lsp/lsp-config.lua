return {
  'neovim/nvim-lspconfig',
  event = { 'BufReadPre', 'BufNewFile' },
  dependencies = {
    'hrsh7th/cmp-nvim-lsp',
    { 'antosha417/nvim-lsp-file-operations', config = true },
  },
  config = function()
    -- import lspconfig plugin
    local lspconfig = require('lspconfig')

    -- import cmp-nvim-lsp plugin
    local cmp_nvim_lsp = require('cmp_nvim_lsp')

    -- used to enable autocompletion (assign to every lsp server config)
    local capabilities = cmp_nvim_lsp.default_capabilities()

    -- Change the Diagnostic symbols in the sign column (gutter)
    -- (not in youtube nvim video)
    local signs = { Error = ' ', Warn = ' ', Hint = '󰠠 ', Info = ' ' }
    for type, icon in pairs(signs) do
      local hl = 'DiagnosticSign' .. type
      vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
    end

    -- Diagnostic settings
    vim.diagnostic.config({
      virtual_text = false, -- disable virtual text
      signs = true,
      update_in_insert = true,
      underline = true,
      severity_sort = true,
      float = {
        focusable = true,
        style = 'minimal',
        border = 'rounded',
        source = 'always',
        -- header = '',
        -- prefix = '',
      },
    })

    -- Global mappings.
    -- See `:help vim.diagnostic.*` for documentation on any of the below functions
    -- FROM: https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#suggested-configuration
    vim.keymap.set('n', '<space>e', vim.diagnostic.open_float)
    vim.keymap.set('n', '[d', vim.diagnostic.goto_prev)
    vim.keymap.set('n', ']d', vim.diagnostic.goto_next)
    vim.keymap.set('n', '<space>q', vim.diagnostic.setloclist)
    vim.keymap.set('n', '<space>Q', vim.diagnostic.setqflist)


    -------------------------------------------
    -- Configure servers with default configs --
    -------------------------------------------
    --
    -- TODO: look at https://github.com/josean-dev/dev-environment-files/pull/43
    local servers = { 'ts_ls', 'html', 'cssls', 'tailwindcss', }

    for _, server in ipairs(servers) do
      lspconfig[server].setup({
        capabilities = capabilities,
        -- on_attach = my_custom_on_attach,
      })
    end


    ------------------------------------------
    -- Here the servers with custom configs --
    ------------------------------------------
    --
    -- Configure Emmet language server
    lspconfig['emmet_ls'].setup({
      capabilities = capabilities,
      filetypes = { 'html', 'javascriptreact', 'css', 'sass', 'scss', 'eruby', 'vue' },
    })

    -- Configure Lua language server (with special settings)
    lspconfig['lua_ls'].setup({
      capabilities = capabilities,
      settings = { -- custom settings for lua
        Lua = {
          -- make the language server recognize 'vim' global
          diagnostics = {
            globals = { 'vim' },
          },
          workspace = {
            -- make language server aware of runtime files
            library = {
              [vim.fn.expand('$VIMRUNTIME/lua')] = true,
              [vim.fn.stdpath('config') .. '/lua'] = true,
            },
          },
        },
      },
    })

    -- Configure Vuejs language server (with special settings)
    -- FROM: https://github.com/neovim/neovim/issues/20010#issuecomment-1968312764
    -- FROM: https://www.reddit.com/r/neovim/comments/xy2xo8/vue_volar_error_request_initialize_failed/
    -- WARN: https://github.com/vuejs/language-tools/discussions/606#discussioncomment-8767785
    lspconfig['volar'].setup({
      init_options = {
        typescript = {
          -- tsdk = '/path/to/.npm/lib/node_modules/typescript/lib'
          -- tsdk = '/Users/alex/.nvm/versions/node/v16.13.2/lib/node_modules/typescript/lib'
          -- tsdk = '/Users/alex/.config/yarn/global/node_modules/typescript/lib'
          tsdk = '/Users/alex/.local/share/nvim/mason/packages/typescript-language-server/node_modules/typescript/lib'
          -- Alternative location if installed as root:
          -- tsdk = '/usr/local/lib/node_modules/typescript/lib'
        }
      }
    })

    -- Configure Ruby language server (with special settings)
    -- FROM: https://github.com/Shopify/ruby-lsp/issues/1248#issuecomment-1968226922
    local ruby_lsp = require('alex.utils.ruby-lsp')
    lspconfig['ruby_lsp'].setup({
      capabilities = capabilities,
      cmd = { '/Users/alex/.rvm/gems/ruby-3.1.4@devpost-teams/bin/ruby-lsp' },
      -- cmd = { '/Users/alex/.local/share/nvim/mason/packages/ruby-lsp/ruby-lsp' },
      filetypes = { 'ruby' },
      on_attach = function(client, buffer)
        ruby_lsp.setup_diagnostics(client, buffer)
        ruby_lsp.add_ruby_deps_command(client, buffer)
      end,
    })


    -- Use LspAttach autocommand to only map the following keys
    -- after the language server attaches to the current buffer
    -- FROM: https://github.com/neovim/nvim-lspconfig?tab=readme-ov-file#suggested-configuration
    vim.api.nvim_create_autocmd('LspAttach', {
      group = vim.api.nvim_create_augroup('UserLspConfig', {}),
      callback = function(ev)
        -- Enable completion triggered by <c-x><c-o>
        vim.bo[ev.buf].omnifunc = 'v:lua.vim.lsp.omnifunc'

        -- Buffer local mappings.
        -- See `:help vim.lsp.*` for documentation on any of the below functions
        local attach_opts = { noremap = true, silent = true, buffer = ev.buf }
        vim.keymap.set('n', 'gD', vim.lsp.buf.declaration, attach_opts) -- Go to declaration
        vim.keymap.set('n', 'gd', vim.lsp.buf.definition, attach_opts)  -- Show LSP definitions
        vim.keymap.set('n', 'F', vim.lsp.buf.hover, attach_opts) -- Show documentation for what is under cursor
        vim.keymap.set('n', 'gi', vim.lsp.buf.implementation, attach_opts)  -- Show LSP implementations
        vim.keymap.set('n', '<M-k>', vim.lsp.buf.signature_help, attach_opts)
        vim.keymap.set('n', '<space>wa', vim.lsp.buf.add_workspace_folder, attach_opts)
        vim.keymap.set('n', '<space>wr', vim.lsp.buf.remove_workspace_folder, attach_opts)
        vim.keymap.set('n', '<space>wl', function()
          print(vim.inspect(vim.lsp.buf.list_workspace_folders()))
        end, attach_opts)
        vim.keymap.set('n', '<space>D', vim.lsp.buf.type_definition, attach_opts)
        vim.keymap.set('n', '<space>rn', vim.lsp.buf.rename, attach_opts) -- Smart rename
        vim.keymap.set({ 'n', 'v' }, '<space>ca', vim.lsp.buf.code_action, attach_opts) -- See available code actions
        vim.keymap.set('n', 'gr', vim.lsp.buf.references, attach_opts) -- Show LSP references
        vim.keymap.set('n', '<space>f', function()
          vim.lsp.buf.format { async = true }
        end, attach_opts)
        vim.keymap.set('n', 'so', require('telescope.builtin').lsp_references, attach_opts)
        vim.keymap.set('n', '<leader>W', '<cmd>Telescope diagnostics bufnr=0<CR>', attach_opts) -- show  diagnostics for file
        vim.keymap.set('n', 'gt', '<cmd>Telescope lsp_type_definitions<CR>', attach_opts) --Show LSP type definitions
      end,
    })
  end,
}
