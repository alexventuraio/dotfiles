-- https://github.com/LunarVim/Neovim-from-scratch/blob/master/lua/user/plugins.lua
-- https://github.com/wbthomason/packer.nvim

-- Autocommand that reloads neovim whenever you save the plugins.lua file
vim.cmd([[
  augroup packer_user_config
    autocmd!
    autocmd BufWritePost plugins.lua source <afile> | PackerSync
  augroup end
]])

local ensure_packer = function()
  local fn = vim.fn
  local install_path = fn.stdpath('data')..'/site/pack/packer/start/packer.nvim'
  if fn.empty(fn.glob(install_path)) > 0 then
    fn.system({'git', 'clone', '--depth', '1', 'https://github.com/wbthomason/packer.nvim', install_path})

    print('Installing packer close and reopen Neovim...')
    
    vim.cmd [[packadd packer.nvim]]
    return true
  end
  return false
end

-- Automatically install packer
local packer_bootstrap = ensure_packer()

return require('packer').startup({
function(use)
  use 'wbthomason/packer.nvim'
  -- My plugins here
  -- use 'foo1/bar1.nvim'
  -- use 'foo2/bar2.nvim'


  -- LSP
  use 'neovim/nvim-lspconfig' -- Configurations for Nvim LSP

  -- CMP - AUTOCOMPLETE
  use 'hrsh7th/cmp-nvim-lsp'     -- LSP source for nvim-cmp
  use 'hrsh7th/cmp-buffer'
  use 'hrsh7th/cmp-path'
  use 'hrsh7th/cmp-cmdline'      -- Autocompletion plugin
  use 'hrsh7th/nvim-cmp'
  -- For ultisnips users.
  use 'quangnguyen30192/cmp-nvim-ultisnips'

  -- For better languages syntax highlighting
  use { 'nvim-treesitter/nvim-treesitter', run = ':TSUpdate' }
  use 'p00f/nvim-ts-rainbow'

  -- TELESCOPE
  use 'nvim-lua/plenary.nvim' -- Useful lua functions used ny lots of plugins
  use 'nvim-telescope/telescope.nvim'

  -- IDE
  use 'windwp/nvim-autopairs' -- Autopairs, integrates with both cmp and treesitter
  use 'numToStr/Comment.nvim'
  use 'JoosepAlviste/nvim-ts-context-commentstring'
  use 'nvim-tree/nvim-tree.lua'
  use {'akinsho/bufferline.nvim', tag = "v3.*" }
  use 'nvim-lualine/lualine.nvim'
  use 'norcalli/nvim-colorizer.lua'
  use 'wakatime/vim-wakatime'
  use 'jlanzarotta/bufexplorer'
  use 'tpope/vim-fugitive'
  use 'tpope/vim-surround'
  use 'tpope/vim-rhubarb' -- required by fugitive to :Gbrowse
  use 'airblade/vim-gitgutter'
  use 'terryma/vim-multiple-cursors'
  use 'SirVer/ultisnips'

  -- RUBY & RAILS
  use 'tpope/vim-bundler'
  use 'tpope/vim-rails'
  use 'vim-ruby/vim-ruby'
  -- use 'tpope/vim-endwise'

  -- WEB DEV
  use 'mattn/emmet-vim'

  -- COLORSCHEMES
  use 'nvim-tree/nvim-web-devicons' -- To have icons in your statusline and files
  use 'marko-cerovac/material.nvim'
  use 'christianchiarulli/nvcode-color-schemes.vim'
  use 'folke/tokyonight.nvim'


  -- Automatically set up your configuration after cloning packer.nvim
  -- Put this at the end after all plugins
  if packer_bootstrap then
    require('packer').sync()
  end
end,
config = {
  display = {
    open_fn = function()  -- Have packer use a popup window
      return require('packer.util').float({ border = 'rounded' })  -- single, double
    end
  }
}})
