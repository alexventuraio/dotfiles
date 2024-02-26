local M = {} -- M stands for module, a naming convention

M.my_func_a = function(a, b, c)
  return 'A - ' .. a, b, c
end

function M.my_func_b(x, y, z)
  return 'B - ' .. x, y, z
end

return M

-- print(require 'alex.utils.funky'.my_func_b(1,2,3))
-- print(require 'alex.utils.funky'.my_func_a(4,5,6)) -- prints 3,4,5
