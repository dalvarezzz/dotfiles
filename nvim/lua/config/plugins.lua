vim.cmd [[packadd packer.nvim]]

require('packer').startup(function()
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use 'rust-lang/rust.vim'
	use 'pangloss/vim-javascript'
	use 'vimwiki/vimwiki' -- vim wiki plugin to create local wiki
	use { 'prettier/vim-prettier', ['do'] = 'npm install' }
	use 'tpope/vim-commentary' -- https://github.com/tpope/vim-commentary
	use 'rktjmp/lush.nvim' -- colorscheme related
	use 'ellisonleao/gruvbox.nvim' -- colorscheme
	use 'EdenEast/nightfox.nvim' -- colorscheme
	use { 'nvim-treesitter/nvim-treesitter', ['do'] = 'TSUpdate' }
	use 'nvim-lua/plenary.nvim'
	use 'nvim-telescope/telescope.nvim'
	use 'windwp/nvim-autopairs'
	use 'rebelot/kanagawa.nvim' -- colorscheme
	use {
        'kyazdani42/nvim-tree.lua',
		requires = { 'kyazdani42/nvim-web-devicons' }
    }
	use { 
		'nvim-lualine/lualine.nvim',
		requires = { 'kyazdani42/nvim-web-devicons', opt = true }
	}
end)

require('plugins.cmp')
require('plugins.lspconfig')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.autopairs')
require('plugins.line')
require('plugins.tree')
