local cmd = vim.cmd

vim.api.nvim_create_autocmd('TextYankPost', {
  desc = 'Highlight on yank',
  group = vim.api.nvim_create_augroup('HighlightOnYank', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      -- timeout = 145,
    })
  end,
})

vim.api.nvim_create_autocmd({'BufWritePre'}, {
  desc = 'Strip trailing whitespace on file save',
  group = vim.api.nvim_create_augroup('StripTrailingWhitespacesOnSave', {}),
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

-- Auto-resize splits when Vim gets resized.
cmd [[
  autocmd VimResized * wincmd =
]]

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
