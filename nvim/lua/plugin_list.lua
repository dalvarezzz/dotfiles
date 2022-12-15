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
  -- lsp configs
  use 'neovim/nvim-lspconfig'
  use 'hrsh7th/nvim-cmp'
  use 'hrsh7th/cmp-nvim-lsp'
  use 'RishabhRD/popfix'
  use 'RishabhRD/nvim-lsputils'
  -- lua snippets
  use 'saadparwaiz1/cmp_luasnip'
  use 'L3MON4D3/LuaSnip'
  -- devicons
  use "kyazdani42/nvim-web-devicons"
  -- Eye candy lsp errors
  use {
    'folke/lsp-colors.nvim',
    config = function()
      require('lsp-colors').setup()
    end
  }
  use {
    "folke/trouble.nvim",
    requires = "kyazdani42/nvim-web-devicons",
    config = function()
      require('trouble').setup {
        icons = false,
        signs = {
          error = "",
          warning = ""
        }
      }
    end
  }
  -- ctrl c for comments
  use {
    'numToStr/Comment.nvim',
    config = function()
      require('Comment').setup()
    end
  }
  -- theme
  use { 'EdenEast/nightfox.nvim', tag = 'v1.0.0' }
  use { 'nvim-treesitter/nvim-treesitter', ['do'] = 'TSUpdate' }
  -- tree sitter objects
  use 'nvim-treesitter/nvim-treesitter-textobjects'
  -- lua fucntions for nvim. Almost every plugin uses it
  use 'nvim-lua/plenary.nvim'
  -- like fzf
  use 'nvim-telescope/telescope.nvim'
  -- automatically open/close html like tags
  use 'windwp/nvim-ts-autotag'
  -- autopair utility
  use 'windwp/nvim-autopairs'
  -- bottom line
  use {
    'nvim-lualine/lualine.nvim',
    requires = {
      'kyazdani42/nvim-web-devicons',
      opt = true
    }
  }
  -- highlight current lsp block
  use {
    'folke/twilight.nvim',
    config = function()
      require('twilight').setup()
    end
  }
  -- zen mode in nvim
  use {
    'folke/zen-mode.nvim',
    config = function()
      require('zen-mode').setup()
    end
  }
  -- dark neovim color scheme
  use {
    'glepnir/zephyr-nvim',
    requires = { 'nvim-treesitter/nvim-treesitter', opt = true },
  }

  -- file tree
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

  -- save nvim session
  use {
    'rmagatti/auto-session',
    config = function()
      require('auto-session').setup {
        log_level = 'error'
      }
    end
  }

  -- greetter screen
  use {
    'goolord/alpha-nvim',
    config = function()
      require 'alpha'.setup(require 'alpha.themes.dashboard'.config)
    end
  }

  -- utility to work with surrounding motions
  use {
    'kylechui/nvim-surround',
    tag = '*',
    config = function()
      require('nvim-surround').setup()
    end
  }
  -- better argument highlights
  use {
    'm-demare/hlargs.nvim',
    requires = { 'nvim-treesitter/nvim-treesitter' },
    config = function()
      require('hlargs').setup()
    end
  }
  -- lsp symbols
  use {
    'simrat39/symbols-outline.nvim',
    config = function()
      require('symbols-outline').setup()
    end
  }

  -- highlight current parameter in lsp signature
  use {
    'ray-x/lsp_signature.nvim',
    config = function()
      require('lsp_signature').setup()
    end
  }

  -- git bars
  use {
    'lewis6991/gitsigns.nvim',
    config = function()
      require('gitsigns').setup()
    end
  }

  -- show lsp loading progress
  use {
    'j-hui/fidget.nvim',
    config = function()
      require('fidget').setup()
    end
  }

  use 'folke/tokyonight.nvim'
  -- git diffs visuals
  use { 'sindrets/diffview.nvim', requires = 'nvim-lua/plenary.nvim' }

  if packer_bootstrap then
    require('packer').sync()
  end
end)

require('plugins_config.lsp')
require('plugins_config.cmp')
require('plugins_config.treesitter')
require('plugins_config.telescope')
require('plugins_config.autopairs')
require('plugins_config.lualine')
