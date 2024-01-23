return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  config = function()
    local config = require("nvim-treesitter.configs")

    config.setup({
      ensure_installed = {
        'html', 'javascript', 'ruby', 'vue', 'css', 'scss', 'markdown', 'json', 'gitignore', 'dockerfile', 'bash', 'typescript', 'lua', 'vim', 'vimdoc', 'query', 'c'
      },
      sync_install = false,
      highlight = { enable = true },
      indent = { enable = true },  
    })
  end
}
