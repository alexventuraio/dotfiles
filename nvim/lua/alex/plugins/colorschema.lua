return {
  {
    'bluz71/vim-nightfly-colors',
    name = 'nightfly',
    -- lazy = false,
    priority = 1000,
    config = function()
      vim.cmd.colorscheme('nightfly')
    end,
  },
  -- {
  --   -- If you are using Packer
  --   'marko-cerovac/material.nvim',
  --   config = function()
  --     local material_functions = require('material.functions')
  --
  --     vim.cmd.colorscheme('material')
  --
  --     vim.keymap.set('n', '<leader>th', material_functions.find_style, {})
  --   end,
  -- },
  -- {
  --   'folke/tokyonight.nvim',
  --   lazy = false,
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme('tokyonight')
  --     -- There are also colorschemes for the different styles.
  --     vim.cmd.colorscheme('tokyonight-night')
  --     vim.cmd.colorscheme('tokyonight-storm')
  --     vim.cmd.colorscheme('tokyonight-day')
  --     vim.cmd.colorscheme('tokyonight-moon')
  --   end,
  -- },
  -- {
  --   'EdenEast/nightfox.nvim',
  --   priority = 1000,
  --   config = function()
  --     vim.cmd.colorscheme('nightfox')
  --   end,
  -- },
}
