return {
  'nvim-telescope/telescope.nvim', tag = '0.1.5',
  -- or                          , branch = '0.1.x',
  dependencies = {
    'nvim-lua/plenary.nvim',
    { 'nvim-telescope/telescope-fzf-native.nvim', build = 'make' },
  },
  -- keys = {
  --   { '<leader>ft', '<cmd>Neotree toggle<cr>', desc = 'NeoTree' },
  --   { 'ff', '<cmd>Telescope find_files<cr>', { desc = 'Fuzzy find files in cwd' }},
  --   { 'fg', '<cmd>Telescope live_grep<cr>', desc = 'Find string in cwd' },
  --   { 'fb', '<cmd>Telescope buffers<cr>', desc = 'Telescope' },
  --   { 'fh', '<cmd>Telescope help_tags<cr>', desc = 'Telescope' },
  -- },
  opts = function()
    local actions = require('telescope.actions')
    local action_layout = require('telescope.actions.layout')

    return {
      defaults = {
        -- Default configuration for telescope goes here:
        -- config_key = value,

        prompt_prefix = ' ',
        selection_caret = ' ',
        -- path_display = { 'smart' },  -- remove as much from the path as possible (causes some slowlyness)
        file_ignore_patterns = { "node%_modules/.*" },

        mappings = {
          i = {
            -- Scroll in Preview <C-d> and <C-u>
            ['<C-s>'] = actions.file_vsplit,
            ['<C-i>'] = actions.file_split,
            ['<C-k>'] = actions.move_selection_previous, -- move to prev result
            ['<C-j>'] = actions.move_selection_next, -- move to next result
            ['<C-q>'] = actions.send_selected_to_qflist + actions.open_qflist,
            ['<C-w>'] = action_layout.toggle_preview -- toggle preview section
          },
          n = {
            ['<C-w>'] = action_layout.toggle_preview
          },
        },

        -- layout_strategy = 'horizontal',
        -- layout_config = {
        --   horizontal = { height = 0.6, width = 0.7 },
        --   prompt_position = 'bottom',
        --   mirror = false,
        --   -- other layout configuration here
        -- },
        -- preview = {
        --   hide_on_startup = false -- hide previewer when picker starts
        -- },

        layout_strategy = 'vertical',
        layout_config = {
          vertical = { height = 0.4, width = 0.5 },
          prompt_position = 'top',
          mirror = false,
          -- other layout configuration here
        },
        preview = {
          hide_on_startup = true -- hide previewer when picker starts
        },
      },
      pickers = {
        find_files = {
          -- theme = 'dropdown',  -- better use it when in 'vertical' layout
        },
      },
    }
  end,
  config = function(_, opts)
    require('telescope').setup(opts)

    -- To get fzf loaded and working with telescope, you need to call
    -- load_extension, somewhere after setup function:
    require('telescope').load_extension('fzf')

    local builtin = require('telescope.builtin')

    vim.keymap.set('n', 'ff', builtin.find_files, {})
    vim.keymap.set('n', 'fg', builtin.live_grep, {})   -- open explorer to live type and grep
    vim.keymap.set('n', 'fw', builtin.grep_string, {}) -- grep for the string under your cursor or selection
    vim.keymap.set('n', 'fb', builtin.buffers, {})
    vim.keymap.set('n', 'fh', builtin.help_tags, {})
  end,
}
