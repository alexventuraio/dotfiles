local M = {}

-- local original_nightfly_theme_colors = {
--   white      = '#c3ccdc',
--   cadet_blue = '#a1aab8',
--   slate_blue = '#2c3043',
--   dark_blue  = '#092236',
--   blue       = '#82aaff',
--   emerald    = '#21c7a8',
--   purple     = '#ae81ff',
--   tan        = '#ecc48d',
--   watermelon = '#ff5874',
-- }

M.custom_colors = {
  blue = '#65D1FF',
  green = '#3EFFDC',
  violet = '#FF61EF',
  yellow = '#FFDA7B',
  red = '#FF4A4A',
  fg = '#c3ccdc',
  bg = '#112638',
  inactive_bg = '#2c3043',
}

M.custom_theme = {
  normal = {
    a = { bg = M.custom_colors.blue, fg = M.custom_colors.bg, gui = 'bold' },
    b = { bg = M.custom_colors.bg, fg = M.custom_colors.fg },
    c = { bg = M.custom_colors.bg, fg = M.custom_colors.fg },
  },
  insert = {
    a = { bg = M.custom_colors.green, fg = M.custom_colors.bg, gui = 'bold' },
    b = { bg = M.custom_colors.bg, fg = M.custom_colors.fg },
    c = { bg = M.custom_colors.bg, fg = M.custom_colors.fg },
  },
  visual = {
    a = { bg = M.custom_colors.violet, fg = M.custom_colors.bg, gui = 'bold' },
    b = { bg = M.custom_colors.bg, fg = M.custom_colors.fg },
    c = { bg = M.custom_colors.bg, fg = M.custom_colors.fg },
  },
  command = {
    a = { bg = M.custom_colors.yellow, fg = M.custom_colors.bg, gui = 'bold' },
    b = { bg = M.custom_colors.bg, fg = M.custom_colors.fg },
    c = { bg = M.custom_colors.bg, fg = M.custom_colors.fg },
  },
  replace = {
    a = { bg = M.custom_colors.red, fg = M.custom_colors.bg, gui = 'bold' },
    b = { bg = M.custom_colors.bg, fg = M.custom_colors.fg },
    c = { bg = M.custom_colors.bg, fg = M.custom_colors.fg },
  },
  inactive = {
    a = { bg = M.custom_colors.inactive_bg, fg = M.custom_colors.semilightgray, gui = 'bold' },
    b = { bg = M.custom_colors.inactive_bg, fg = M.custom_colors.semilightgray },
    c = { bg = M.custom_colors.inactive_bg, fg = M.custom_colors.semilightgray },
  },
}

return M
