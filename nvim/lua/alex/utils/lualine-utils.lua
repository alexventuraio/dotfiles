local M = {}

local my_lualine = require('lua.alex.utils.lualine-custom-theme')


-- Truncating components in smaller window
-- https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#truncating-components-in-smaller-window
--- @param trunc_width (number) trunctates component when screen width is less then trunc_width
--- @param trunc_len (number) truncates component to the given number of chars
--- @param hide_in_width (number) hides component when window width is smaller then hide_in_width
--- @param no_ellipsis (boolean) whether to disable adding '…' at end after truncation
--- return function that can format the component accordingly
function M:trunc(trunc_width, trunc_len, hide_in_width, no_ellipsis)
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


-- Changing filename color based on modified status
-- https://github.com/nvim-lualine/lualine.nvim/wiki/Component-snippets#changing-filename-color-based-on--modified-status
local custom_fname = require('lualine.components.filename'):extend()
local highlight = require 'lualine.highlight'
local default_status_colors = {
  saved = my_lualine.custom_colors.fg,
  modified = my_lualine.custom_colors.yellow
}

function custom_fname:init(options)
  custom_fname.super.init(self, options)

  self.status_colors = {
    saved = highlight.create_component_highlight_group(
      { fg = default_status_colors.saved }, 'filename_status_saved', self.options
    ),
    modified = highlight.create_component_highlight_group(
      { fg = default_status_colors.modified }, 'filename_status_modified', self.options
    ),
  }

  if self.options.color == nil then self.options.color = '' end
end

function custom_fname:update_status()
  local data = custom_fname.super.update_status(self)

  data = highlight.component_format_highlight(vim.bo.modified
    and self.status_colors.modified
    or self.status_colors.saved) .. data

  return data
end

M.custom_fname = custom_fname

return M
