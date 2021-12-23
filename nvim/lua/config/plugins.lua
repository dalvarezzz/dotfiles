local Plug = vim.fn['plug#']

vim.call('plug#begin', '~/.config/nvim/plugged')
Plug 'neovim/nvim-lspconfig'
Plug 'itchyny/lightline.vim' -- color line at the bottom
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'vimwiki/vimwiki' -- vim wiki plugin to create local wiki
Plug('prettier/vim-prettier', { ['do'] = 'npm install' })
Plug 'tpope/vim-commentary' -- https://github.com/tpope/vim-commentary
Plug 'rktjmp/lush.nvim'
Plug 'ellisonleao/gruvbox.nvim'
vim.call('plug#end')

