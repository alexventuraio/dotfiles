return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function()
    local lazy_status = require('lazy.status') -- to configure lazy pending updates count
    local lualine_utils = require('alex.utils.lualine-utils')

    return {
      options = {
        theme = 'tokyonight',
        disabled_filetypes = { 'NvimTree', 'neo-tree' },
        -- component_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = ''},
        -- section_separators = { left = '', right = '' },
      },
      sections = {
        lualine_b = {
          {
            'branch',
            fmt=lualine_utils.trunc(120, 19, 90, false),
            color= { bg = '#a1aab8', fg = '#092236' },
            separator = { left = '', right = ''}
          },
          { 'diff' },
          { 'diagnostics' },
        },
        lualine_c = {
          {
            lualine_utils.custom_filename(),
            newfile_status = true,   -- Display new file status (new file means no write after created)
            path = 1,                -- 1: Relative path
            symbols = {
              modified = '',        -- Text to show when the file is modified.
              readonly = '',        -- Text to show when the file is non-modifiable or readonly.
              unnamed = '[No Name]', -- Text to show for unnamed buffers.
              newfile = '[New File]',-- Text to show for newly created file before first write
            }
          }
        },
        lualine_x = {
          {
            lazy_status.updates,
            cond = lazy_status.has_updates,
            color = { fg = '#ff9e64' },
          },
          { 'encoding' },
          { 'fileformat' },
          { 'filetype' },
        },
      },
      inactive_sections = {
        lualine_c = {
          {
            lualine_utils.custom_filename(),
            newfile_status = true,   -- Display new file status (new file means no write after created)
            path = 1,                -- 1: Relative path
            symbols = {
              modified = '',        -- Text to show when the file is modified.
              newfile = '[New File]',-- Text to show for newly created file before first write
            }
          }
        },
      },
    }
  end,
  config = function(_, opts)
    -- configure lualine with modified theme
    require('lualine').setup(opts)
  end,
}
