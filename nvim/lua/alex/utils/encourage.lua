-- FROM: https://github.com/r-cha/encourage.nvim
local M = {}

local default_encouragements = {
  'Great job! ✨',
  "You're doing great! 💪",
  'Keep up the good work! 🌟',
  'Well done! 🎉',
  'Onward and upward! 🚀',
  "You're on fire! 🔥",
  "You're a star! ⭐️",
  "You're amazing! 🌈",
  'That was awesome! 🎈',
  'Smart move. 🧠',
  'Bravo! 👏',
  'Nailed it. 🔨',
}

local function show_floating_message(message)
  local width = #message
  local height = 1
  local buf = vim.api.nvim_create_buf(false, true)
  local win_height = vim.api.nvim_get_option_value('lines', {})
  local win_width = vim.api.nvim_get_option_value('columns', {})

  local opts = {
    style = 'minimal',
    relative = 'editor',
    width = width,
    height = height,
    row = win_height - height - 4,
    col = win_width - width - 2,
    border = 'rounded',
  }

  local win = vim.api.nvim_open_win(buf, false, opts)
  vim.api.nvim_buf_set_lines(buf, 0, -1, false, { ' ' .. message .. ' ' })

  -- Use FloatBorder for the border color
  vim.api.nvim_set_option_value('winhl', 'Normal:NormalFloat,FloatBorder:FloatBorder', { win = win })

  -- Set a timer to close the window after 5 seconds
  vim.defer_fn(function()
    if vim.api.nvim_win_is_valid(win) then
      vim.api.nvim_win_close(win, true)
    end
  end, 5000)
end

local function custom_write_message(encouragements)
  -- Choose a random message
  local message = encouragements[math.random(#encouragements)]
  -- Display the custom message in a floating window
  show_floating_message(message)
end

-- INFO: coming from https://github.com/r-cha/encourage.nvim/pull/1
-- ---Chooses a random message and displays it using the notify API
-- ---@param encouragements string[]
-- local function custom_write_message(encouragements)
--   local message = encouragements[math.random(#encouragements)]
--   -- The third parameter is ignored by default, unless you have a plugin like `nvim-notify`
--   vim.notify(message, nil, { title = 'encourage.nvim' } )
-- end

function M.setup(opts)
  opts = opts or {}
  local encouragements = opts.messages or default_encouragements
  local plugin = vim.api.nvim_create_augroup('CustomWriteMessage', { clear = true })
  vim.api.nvim_create_autocmd('BufWritePost', {
    group = plugin,
    callback = function()
      custom_write_message(encouragements)
    end
  })
end

return M
