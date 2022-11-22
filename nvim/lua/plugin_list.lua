local fn = vim.fn
local install_path = fn.stdpath('data') .. '/site/pack/packer/start/packer.nvim'
local packer_bootstrap = nil
if fn.empty(fn.glob(install_path)) > 0 then
  packer_bootstrap = fn.system {
    'git',
    'clone',
    '--depth',
    '1',
    'https://github.com/wbthomason/packer.nvim',
    install_path
  }
end

require('packer').startup(function(use)
  use 'wbthomason/packer.nvim'
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  -- use {
  --       'rust-lang/rust.vim',
  --       opt = true
  -- }
  use {
        'numToStr/Comment.nvim',
        config = function()
          require('Comment').setup()
        end
  }
  use { 'EdenEast/nightfox.nvim', tag = 'v1.0.0' }
  use {
        'lewis6991/gitsigns.nvim',
  }
  use { 'nvim-treesitter/nvim-treesitter', ['do'] = 'TSUpdate' }
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  use 'nvim-lua/plenary.nvim'
  use 'nvim-telescope/telescope.nvim'
  use 'windwp/nvim-autopairs'
  use {
        'nvim-lualine/lualine.nvim',
        requires = {
            'kyazdani42/nvim-web-devicons',
            opt = true
        }
  }
  use {
        'folke/twilight.nvim',
        config = function()
          require('twilight').setup()
        end
  }
  use {
        'folke/zen-mode.nvim',
        config = function()
          require('zen-mode').setup()
        end
  }
  use 'mfussenegger/nvim-lint'
  use {
    'glepnir/zephyr-nvim',
    requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
  }

  use 'nvim-tree/nvim-web-devicons'

  use {
    'nvim-tree/nvim-tree.lua',
    requires = {
      'nvim-tree/nvim-web-devicons',
    },
    tag = 'nightly',
    config = function()
      require('nvim-tree').setup()
    end
  }

  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup()
    end
  }

  use {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  }

  use {
    'kylechui/nvim-surround',
    tag = '*',
    config = function()
      require('nvim-surround').setup()
    end
  }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

require('config.lspconfig')
require('config.cmp')
require('config.treesitter')
require('config.telescope')
require('config.autopairs')
require('config.lualine')
