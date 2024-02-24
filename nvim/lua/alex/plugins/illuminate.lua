return {
  'RRethy/vim-illuminate',
  event = "VeryLazy",
  opts = {
    providers = {
      -- 'regex', -- Remove this when LSP is setup properly
    },
  },
  config = function(_, opts)
    require('illuminate').configure(opts)

    vim.api.nvim_set_hl(0, 'IlluminatedWordText', { link = 'Visual' })
    vim.api.nvim_set_hl(0, 'IlluminatedWordRead', { link = 'Visual' })
    vim.api.nvim_set_hl(0, 'IlluminatedWordWrite', { link = 'Visual' })
  end
}
