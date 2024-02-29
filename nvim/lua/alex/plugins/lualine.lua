return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = function()
    local lazy_status = require('lazy.status') -- to configure lazy pending updates count

    --- https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#truncating-components-in-smaller-window
    --- @param trunc_width (number) trunctates component when screen width is less then trunc_width
    --- @param trunc_len (number) truncates component to the given number of chars
    --- @param hide_in_width (number) hides component when window width is smaller then hide_in_width
    --- @param no_ellipsis (boolean) whether to disable adding '…' at end after truncation
    --- return function that can format the component accordingly
    local function trunc(trunc_width, trunc_len, hide_in_width, no_ellipsis)
      return function(original_string)
        local win_width = vim.fn.winwidth(0)

        if hide_in_width and (win_width < hide_in_width) then
          return ''
        elseif trunc_width and trunc_len and (win_width < trunc_width) and (#original_string > trunc_len) then
          return original_string:sub(1, trunc_len) .. (no_ellipsis and '' or '…')
        end

        return original_string
      end
    end

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
            fmt=trunc(120, 19, 90, false),
            color= { bg = '#a1aab8', fg = '#092236' },
            separator = { left = '', right = ''}
          },
          { 'diff' },
          { 'diagnostics' },
        },
        lualine_c = {
          {
            'filename',
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
            'filename',
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
