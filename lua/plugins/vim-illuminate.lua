return {
  'RRethy/vim-illuminate',
  lazy = false,
  config = function()
    require('illuminate').configure({
      providers = {
        'regex', -- Remove this when LSP is setup properly
      },
    })

    vim.api.nvim_set_hl(0, 'IlluminatedWordText', { link = 'Visual' })
    vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'Visual' })
    vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'Visual' })
  end
}
