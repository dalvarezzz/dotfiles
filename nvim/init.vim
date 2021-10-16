set nocompatible
set encoding=utf-8
set wildmenu
set number
set showcmd

syntax on
set showmode
filetype plugin indent on

set smartcase

set tabstop=2
set shiftwidth=2
set softtabstop=2
set smarttab
set cindent
set expandtab
set hidden

set autoindent

" Proper search
set ignorecase
set gdefault
set incsearch " search as characters are entered
set hlsearch " highlight matches

set background=dark

" coc.vim readme config https://github.com/neoclide/coc.nvim
set updatetime=300
set cmdheight=2
set shortmess+=c

set termguicolors

call plug#begin('~/.config/nvim/plugged')
Plug 'neoclide/coc.nvim', {'branch': 'release'} " conquer of completion 
Plug 'junegunn/fzf', { 'do': { -> fzf#install() } } " fuzzy finder 
Plug 'junegunn/fzf.vim'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' } " golang plugin
" Plug 'AndrewRadev/splitjoin.vim' " split join for golang
Plug 'itchyny/lightline.vim' " color line at the bottom
Plug 'rust-lang/rust.vim'
Plug 'pangloss/vim-javascript'
Plug 'vimwiki/vimwiki'
Plug 'prettier/vim-prettier', { 'do': 'npm install' }
Plug 'tpope/vim-commentary' "https://github.com/tpope/vim-commentary
Plug 'morhetz/gruvbox'
call plug#end()

" Set it by hand, this is either overwritten by vim itself or vim go
" set completeopt=noselect,menuone

" jk map to Esc
imap jk <Esc>
:let mapleader = ","

nnoremap j gj
nnoremap k gk

" Rust config
let g:rustfmt_autosave = 1

" fuzzy finder remap
nnoremap <leader>f :FZF<CR>

" golang plugin
autocmd FileType go map <C-n> :cnext<CR>
autocmd FileType go map <C-m> :cprevious<CR>
nnoremap <leader>a :cclose<CR>
autocmd FileType go nmap <leader>b <Plug>(go-build)
autocmd FileType go nmap <leader>r <Plug>(go-run)
autocmd FileType go nmap <leader>t <Plug>(go-test)
autocmd FileType go nmap <leader>c <Plug>(go-coverage-toggle)
autocmd FileType go nmap <Leader>i <Plug>(go-info)
autocmd FileType go inoremap <buffer> . .<C-x><C-o>
let g:go_def_mode = 'gopls'
let g:go_info_mode = 'gopls'
let g:go_fmt_command = "goimports"
let g:go_list_type = "quickfix"
let g:go_gopls_comleted_unimported=1
let g:go_highlight_fields = 1
let g:go_highlight_functions = 1
let g:go_highlight_function_calls = 1
let g:go_highlight_operators = 1
let g:go_highlight_extra_types= 1
let g:go_auto_type_info = 1

let g:gruvbox_italic=1
let g:gruvbox_contrast_dark=1
autocmd vimenter * ++nested colorscheme gruvbox

" coc configs
inoremap <silent><expr> <c-.> coc#refresh()

" Use <cr> to confirm completion, `<C-g>u` means break undo chain at current
" position. Coc only does snippet and additional edit on confirm.
if exists('*complete_info')
  inoremap <expr> <cr> complete_info()["selected"] != "-1" ? "\<C-y>" : "\<C-g>u\<CR>"
else
  imap <expr> <cr> pumvisible() ? "\<C-y>" : "\<C-g>u\<CR>"
endif

nmap <silent> gd <Plug>(coc-definition)
nmap <silent> gy <Plug>(coc-type-definition)
nmap <silent> gi <Plug>(coc-implementation)
nmap <silent> gr <Plug>(coc-references)

" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>

function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  else
    call CocAction('doHover')
  endif
endfunction

" 'Smart' nevigation
" Use tab for trigger completion with characters ahead and navigate.
" NOTE: Use command ':verbose imap <tab>' to make sure tab is not mapped by
" other plugin before putting this into your config.
inoremap <silent><expr> <Tab>
      \ pumvisible() ? "\<C-n>" :
      \ <SID>check_back_space() ? "\<Tab>" :
      \ coc#refresh()

inoremap <silent><expr> <c-space> coc#refresh()

function! s:check_back_space() abort
  let col = col('.') - 1
  return !col || getline('.')[col - 1]  =~# '\s'
endfunction

inoremap <expr> <Tab> pumvisible() ? "\<C-n>" : "\<Tab>"
inoremap <expr> <S-Tab> pumvisible() ? "\<C-p>" : "\<S-Tab>"

" Make <CR> auto-select the first completion item and notify coc.nvim to
" format on enter, <cr> could be remapped by other vim plugin
inoremap <silent><expr> <cr> pumvisible() ? coc#_select_confirm()
                              \: "\<C-g>u\<CR>\<c-r>=coc#on_enter()\<CR>"

" lightline plugin
let g:lightline = {
      \ 'active': {
      \   'left': [ [ 'mode', 'paste' ],
      \             [ 'cocstatus', 'readonly', 'filename', 'modified' ] ]
      \ },
      \ 'component_function': {
      \   'filename': 'LightlineFilename',
      \   'cocstatus': 'coc#status'
      \ },
      \ }
function! LightlineFilename()
  return expand('%:t') !=# '' ? @% : '[No Name]'
endfunction
