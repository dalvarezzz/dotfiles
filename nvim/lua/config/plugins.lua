local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'saadparwaiz1/cmp_luasnip'
Plug 'L3MON4D3/LuaSnip'
Plug 'itchyny/lightline.vim' -- color line at the bottom
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'vimwiki/vimwiki' -- vim wiki plugin to create local wiki
Plug('prettier/vim-prettier', { ['do'] = 'npm install' })
Plug 'tpope/vim-commentary' -- https://github.com/tpope/vim-commentary
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
Plug('nvim-treesitter/nvim-treesitter', { ['do'] = 'TSUpdate' })
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'windwp/nvim-autopairs'

vim.call('plug#end')

require('plugins.cmp')
require('plugins.lspconfig')
require('plugins.treesitter')
require('plugins.telescope')
require('plugins.autopairs')
