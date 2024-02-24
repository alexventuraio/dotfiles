local cmd = vim.cmd

-- Highlight on yank
vim.api.nvim_create_autocmd('TextYankPost', {
  group = vim.api.nvim_create_augroup('HighlightOnYank', {}),
  pattern = '*',
  callback = function()
    vim.highlight.on_yank({
      higroup = 'IncSearch',
      -- timeout = 145,
    })
  end,
})

-- Strip trailing whitespace on save
vim.api.nvim_create_autocmd({'BufWritePre'}, {
  group = vim.api.nvim_create_augroup('StripTrailingWhitespacesOnSave', {}),
  pattern = '*',
  command = [[%s/\s\+$//e]],
})

-- Auto-resize splits when Vim gets resized.
cmd [[
  autocmd VimResized * wincmd =
]]

-- Stops automatically commenting the next line when pressing Enter on a commented line.
-- Automatically insert the current comment leader after hitting <Enter> in Insert mode.
-- https://neovim.discourse.group/t/options-formatoptions-not-working-when-put-in-init-lua/3746/5
-- https://superuser.com/a/271024
vim.api.nvim_create_autocmd({ 'BufWinEnter' }, {
  callback = function()
    cmd [[ set formatoptions-=cro ]]
  end,
})

vim.api.nvim_create_user_command(
  'Browse',
  function (opts)
    vim.fn.system({ 'open', opts.fargs[1] })
  end,
  { nargs = 1 }
)
