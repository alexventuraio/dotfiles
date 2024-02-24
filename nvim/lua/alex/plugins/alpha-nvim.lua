return {
  'goolord/alpha-nvim',
  event = 'VimEnter',
  dependencies = { 'nvim-tree/nvim-web-devicons' },
  config = function()
    local alpha = require('alpha')
    local dashboard = require('alpha.themes.dashboard')

    -- Set header
    dashboard.section.header.val = {
      '                                                    .',
      '  ███╗   ██╗███████╗ ██████╗ ██╗   ██╗██╗███╗   ███╗.',
      '  ████╗  ██║██╔════╝██╔═══██╗██║   ██║██║████╗ ████║.',
      '  ██╔██╗ ██║█████╗  ██║   ██║██║   ██║██║██╔████╔██║.',
      '  ██║╚██╗██║██╔══╝  ██║   ██║╚██╗ ██╔╝██║██║╚██╔╝██║.',
      '  ██║ ╚████║███████╗╚██████╔╝ ╚████╔╝ ██║██║ ╚═╝ ██║.',
      '  ╚═╝  ╚═══╝╚══════╝ ╚═════╝   ╚═══╝  ╚═╝╚═╝     ╚═╝.',
      '                                                    ·',
    }

    -- Set menu
    dashboard.section.buttons.val = {
      dashboard.button('e', '  > New File', '<cmd>ene<CR>'),
      dashboard.button('SPC m', '  > Toggle file explorer', '<cmd>NvimTreeToggle<CR>'),
      dashboard.button('SPC ff', '󰱼  > Find File', '<cmd>Telescope find_files<CR>'),
      dashboard.button('SPC fg', '  > Find Word', '<cmd>Telescope live_grep<CR>'),
      dashboard.button('q', ' > Quit NVIM', '<cmd>qa<CR>'),
    }

    -- Send config to alpha
    alpha.setup(dashboard.opts)

    -- Disable folding on alpha buffer
    vim.cmd([[ autocmd FileType alpha setlocal nofoldenable ]])

    -- require'alpha'.setup(require'alpha.themes.startify'.config)
    -- require'alpha'.setup(require'alpha.themes.dashboard'.config)
    -- require'alpha'.setup(require'alpha.themes.theta'.config)
  end,
};
