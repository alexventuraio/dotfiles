---@class lazyvim.util.lsp
local M = {}

M.my_func_a = function(a,b,c)
  return 'A - ' .. a,b,c
end

function M.my_func_b(a,b,c)
  return 'B - ' .. a,b,c
end

return M


-- local M = {}
--
-- function M.code_action_listener()
-- end
--
-- return M
