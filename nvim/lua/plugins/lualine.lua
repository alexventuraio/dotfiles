local function get_branch()
  require('lualine.components.branch.git_branch').init()

  local branch = require('lualine.components.branch.git_branch').get_branch()
  local strw = vim.api.nvim_strwidth(branch)

  return ('…%s'):format(branch:sub(strw - 19, strw))
end

return {
  'nvim-lualine/lualine.nvim',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  opts = {
    options = {
      icons_enabled = true,
      theme = 'auto',
      disabled_filetypes = { 'NeoTree' },
      component_separators = { left = '', right = '' },
      -- section_separators = { left = '', right = '' },
      section_separators = { left = '', right = '' },
    },
    sections = {
      lualine_b = {
        {
          'branch',
          fmt = get_branch,
        },
        {
          'diff',
          colored = true, -- Displays a colored diff status if set to true
          diff_color = {
            -- Same color values as the general color option can be used here.
            added    = 'DiffAdd',    -- Changes the diff's added color
            modified = 'DiffChange', -- Changes the diff's modified color
            removed  = 'DiffDelete', -- Changes the diff's removed color you
          },
        },
        'diagnostics'
      },
      lualine_c = {
        {
          'filename',
          file_status = true,      -- Displays file status (readonly status, modified status)
          newfile_status = true,   -- Display new file status (new file means no write after created)
          full_path = true,        -- 1: Relative path
          path = 1,
        }
      },
    },
    inactive_sections = {
      lualine_c = {
        {
          'filename',
          file_status = true,      -- Displays file status (readonly status, modified status)
          newfile_status = true,   -- Display new file status (new file means no write after created)
          full_path = true,        -- 1: Relative path
          path = 1,
        }
      },
    },
  }
}
