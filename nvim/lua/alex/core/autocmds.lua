local cmd = vim.cmd

vim.api.nvim_create_autocmd('FileType', {
  desc = 'To close the Help window from with q',
  pattern = { 'help' },
  callback = function()
    vim.keymap.set('n', 'q', vim.cmd.quit)
  end
})

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank (copying) text',
  group = vim.api.nvim_create_augroup('HighlightOnYank', { clear = true }),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      -- timeout = 145,
    })
  end,
})

vim.api.nvim_create_autocmd({ 'BufWritePre' }, {
  desc = 'Strip trailing whitespace on file save',
  group = vim.api.nvim_create_augroup('StripTrailingWhitespacesOnSave', {}),
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

vim.api.nvim_create_autocmd('VimResized', {
  desc = 'Auto-resize splits when Vim gets resized',
  group = vim.api.nvim_create_augroup('ResizeWindowSplitsOnResized', {}),
  pattern = '*',
  command = [[ wincmd = ]],
})

-- Prevents from automatically inserting the current comment leader after hitting <Enter> in Insert mode.
-- https://neovim.discourse.group/t/options-formatoptions-not-working-when-put-in-init-lua/3746/5
-- https://superuser.com/a/271024
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  desc = 'Stops automatically commenting the next line when pressing Enter on a commented line',
  callback = function()
    cmd [[ set formatoptions-=cro ]]
  end,
})

-- Custom command for :GBrowser to work properly
vim.api.nvim_create_user_command(
  'Browse',
  function (opts)
    vim.fn.system({ 'open', opts.fargs[1] })
  end,
  {
    nargs = 1,
    desc = 'Open Github in the web browser pointing to the current file.',
  }
)

-- FROM: https://github.com/nvim-tree/nvim-tree.lua/wiki/Open-At-Startup#open-for-directories-and-change-neovims-directory
vim.api.nvim_create_autocmd('VimEnter', {
  desc = 'Open Nvim-Tree on the given directory from command line',
  callback = function(data)
    -- buffer is a directory
    local directory = vim.fn.isdirectory(data.file) == 1

    if not directory then
      return
    end

    -- change to the directory
    vim.cmd.cd(data.file)
  end
})
