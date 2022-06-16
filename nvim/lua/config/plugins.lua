require('packer').startup(function(use)
	use 'wbthomason/packer.nvim'
	use 'neovim/nvim-lspconfig'
	use 'hrsh7th/nvim-cmp'
	use 'hrsh7th/cmp-nvim-lsp'
	use 'saadparwaiz1/cmp_luasnip'
	use 'L3MON4D3/LuaSnip'
	use {
        'rust-lang/rust.vim',
        opt = true
    }
	use 'tpope/vim-commentary' -- https://github.com/tpope/vim-commentary
    -- colorscheme
	use {
        'ellisonleao/gruvbox.nvim'
    }
	use 'EdenEast/nightfox.nvim' -- colorscheme
	use { 'nvim-treesitter/nvim-treesitter', ['do'] = 'TSUpdate' }
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
end)

require('plugins.cmp')
require('plugins.lspconfig')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.autopairs')
require('plugins.lualine')
