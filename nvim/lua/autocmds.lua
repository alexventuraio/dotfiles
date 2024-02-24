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

-- To close the Git Blame window from Fugitive with q
cmd [[
  autocmd FileType fugitiveblame nmap <buffer> q gq
]]
