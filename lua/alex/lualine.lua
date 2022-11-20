local status_ok, lualine = pcall(require, 'lualine')
if not status_ok then
  return
end

lualine.setup({
  options = {
    icons_enabled = true,
    theme = 'powerline',
    disabled_filetypes = { 'NvimTree' },
    component_separators = { left = '', right = '' },
    section_separators = { left = '', right = '' },
  },
  sections = {
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
})
