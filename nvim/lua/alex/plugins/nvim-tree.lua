return {
  'nvim-tree/nvim-tree.lua',
  version = '*',
  -- lazy = false,
  dependencies = {
    'nvim-tree/nvim-web-devicons',
  },
  keys = {
    { '\\', '<cmd>NvimTreeFindFileToggle<CR>', desc = 'Close tree or change cursor in the tree for the current bufname' },
    { '<leader>m', '<cmd>NvimTreeToggle<CR>', desc = 'Toggle NvimTree' },
    { '<leader>n', '<cmd>NvimTreeFindFile<CR>', desc = 'Find current bufname in NvimTree' },
    { '<leader>r', '<cmd>NvimTreeRefresh<CR>', desc = 'Refresh NvimTree' },
  },
  opts = {
    view = {},
    renderer = {
      highlight_git = 'all',
      highlight_diagnostics = 'all',
      highlight_opened_files = 'all',
      highlight_modified = 'all',
      indent_markers = {
        enable = true,          -- Show lines in the tree
      },
      icons = {
        glyphs = {
          folder = {
            -- arrow_closed = '', -- arrow when folder is closed
            -- arrow_open = '',   -- arrow when folder is open
            arrow_closed = '󰁕', -- arrow when folder is closed
            arrow_open = '󰁆',   -- arrow when folder is open
          },
        },
      },
    },
    hijack_directories = {
      -- https://github.com/nvim-tree/nvim-tree.lua/issues/659#issuecomment-950156327
      enable = false,           -- Keep it to false and 'open_on_setup_file' to false to hide explorer on startup
    },
    update_focused_file = {
      enable = true,            -- Focus the current buffer file in NvimTree
      update_root = false,      -- To update the root dir if the file is out of the current one
    },
    diagnostics = {
      enable = true,
      show_on_dirs = true,
      icons = {
        hint = '',
        info = '',
        warning = '',
        error = '',
      },
    },
    filters = {
      custom = { '.DS_Store' },
    },
    git = {
      ignore = false,           -- False to show ignored folders like 'node_modules'
    },
    actions = {
      open_file = {
        quit_on_open = false,   -- Closes the explorer when opening a file.
        window_picker = {
          enable = true,
        },
      },
    },
  },
  config = function(_, opts)
    -- Change color for arrows in tree to light blue
    vim.cmd([[ highlight NvimTreeFolderArrowClosed guifg=#3FC5FF ]])
    vim.cmd([[ highlight NvimTreeFolderArrowOpen guifg=#3FC5FF ]])


    -- Automatically open file upon creation
    -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Recipes#automatically-open-file-upon-creation
    local api = require('nvim-tree.api')
    api.events.subscribe(api.events.Event.FileCreated, function(file)
      vim.cmd('edit ' .. file.fname)
    end)


    -- Custom Mappings
    -- https://github.com/nvim-tree/nvim-tree.lua?tab=readme-ov-file#custom-mappings
    -- https://github.com/nvim-tree/nvim-tree.lua/wiki/Archived#example
    local function my_on_attach(bufnr)
      local function my_opts(desc)
        return { desc = 'nvim-tree: ' .. desc, buffer = bufnr, noremap = true, silent = true, nowait = true }
      end

      -- default mappings
      api.config.mappings.default_on_attach(bufnr)

      -- custom mappings
      -- vim.keymap.set('n', '<C-t>', api.tree.change_root_to_parent,        my_opts('Up'))
      vim.keymap.set('n', '?', api.tree.toggle_help,     my_opts('Help'))
      vim.keymap.set('n', 's', api.node.open.vertical,   my_opts('Open: Vertical Split'))
      vim.keymap.set('n', 'i', api.node.open.horizontal, my_opts('Open: Horizontal Split'))
      vim.keymap.set('n', 't', api.node.open.tab,        my_opts('Open: New Tab'))
    end
    -- pass to setup along with your other options
    opts.on_attach = my_on_attach


    require('nvim-tree').setup(opts)
  end,
}
