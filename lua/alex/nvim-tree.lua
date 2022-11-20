require('nvim-tree').setup({
  -- auto_close = true,
  open_on_setup = false,
  open_on_setup_file = false,  -- If set to true with hijack_directories to false, will create a new buffer on startup
  open_on_tab = true,         -- Seems like it keeps the explorer in every tab
  -- focus_empty_on_setup = true, -- DEPRECATED: see https://bit.ly/3yJch2T
  reload_on_bufenter = true,
  view = {
    -- 	auto_resize = true,
    mappings = {
      list = {
        -- user mappings go here
        { key = { 'C', '<2-RightMouse>' }, action = 'cd' },
        { key = 's', action = 'vsplit' },
        { key = 'i', action = 'split' },
        { key = 't', action = 'tabnew' },
        { key = 'R', action = 'refresh' },
        { key = 'a', action = 'create' },
        { key = 'd', action = 'remove' },
        { key = 'D', action = 'trash' },
        { key = 'r', action = 'rename' },
        { key = 'x', action = 'cut' },
        { key = 'c', action = 'copy' },
        { key = 'p', action = 'paste' },
        { key = 'y', action = 'copy_name' },
        { key = 'Y', action = 'copy_path' },
        { key = 'gy', action = 'copy_absolute_path' },
        { key = 'v',  action = 'system_open' },
      },
    },
  },
  renderer = {
    indent_markers = {
      enable = true,          -- Show lines in the tree
    }
  },
  hijack_directories = {
    -- https://github.com/nvim-tree/nvim-tree.lua/issues/659#issuecomment-950156327
    enable = false,           -- Keep it to false and 'open_on_setup_file' to false to hide explorer on startup
  },
  diagnostics = {
    enable = true,
    show_on_dirs = true,
  },
  filters = {
    dotfiles = false,         -- True to hide dotfiles
    custom = { 'node_modules', 'tmp' },
    exclude = {},
  },
  git = {
    ignore = true,            -- False to show ignored folders like 'node_modules'
  },
  actions = {
    open_file = {
      quit_on_open = false,   -- Closes the explorer when opening a file.
      resize_window = true,
    },
    remove_file = {
      close_window = true,
    },
  },
})

-- https://github.com/nvim-tree/nvim-tree.lua/issues/1005#issuecomment-1115831363
-- Automatically close the tab/vim when nvim-tree is the last window in the tab.
-- nvim-tree is also there in modified buffers so this function filter it out
local modifiedBufs = function(bufs)
  local t = 0
  for k,v in pairs(bufs) do
    if v.name:match("NvimTree_") == nil then
      t = t + 1
    end
  end
  return t
end

vim.api.nvim_create_autocmd("BufEnter", {
  nested = true,
  callback = function()
    if #vim.api.nvim_list_wins() == 1 and
      vim.api.nvim_buf_get_name(0):match("NvimTree_") ~= nil and
      modifiedBufs(vim.fn.getbufinfo({bufmodified = 1})) == 0 then
      vim.cmd "quit"
    end
  end
})
