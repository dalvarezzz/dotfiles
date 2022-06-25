require('config.basic')
require('config.autocommand')
require('config.keymaps')

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
    use {
        'numToStr/Comment.nvim',
        config = function()
            require('Comment').setup()
        end
    }
    use {
        'ellisonleao/gruvbox.nvim'
    }
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

require('config.lspconfig')
require('config.cmp')
require('config.treesitter')
require('config.telescope')
require('config.autopairs')
require('config.lualine')
require('config.colors')
