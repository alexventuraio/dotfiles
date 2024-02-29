local M = {}


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


return M
