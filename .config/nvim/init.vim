let mapleader=","

call plug#begin('~/.config/nvim/plugged')
Plug 'tpope/vim-surround'
Plug 'tpope/vim-commentary'
Plug 'scrooloose/nerdtree'
Plug 'jreybert/vimagit'
Plug 'vimwiki/vimwiki'
Plug 'lervag/vimtex'
Plug 'Yggdroot/indentLine'
Plug 'itchyny/lightline.vim'
Plug 'shinchu/lightline-gruvbox.vim'
Plug 'lifepillar/vim-gruvbox8'
Plug 'kovetskiy/sxhkd-vim'
Plug 'neoclide/coc.nvim', {'branch': 'release'}
call plug#end()

" Settings
nnoremap c "_c
set nocompatible
filetype plugin on
syntax on

set tabstop=4 softtabstop=4
set shiftwidth=4
set expandtab
set cursorline
set number
set title
set go=a
set mouse=a
set encoding=utf8
set noruler
set hidden
set nobackup
set nowritebackup
set noshowmode
set updatetime=300
set shortmess+=c
set clipboard+=unnamedplus
set incsearch
set hlsearch

" Colors/theme
set bg=dark
set termguicolors
colorscheme gruvbox8_hard

" Enable autocompletion:
set wildmode=longest,list,full

" highlight cancel
map <leader>m :noh<CR>

" Spell-check set to <leader>o, 'o' for 'orthography':
map <leader>o :setlocal spell! spelllang=en_us<CR>

" Fix indentation in file
map <leader>i mmgg=G`m<CR>

" autocompletion upon save
command! -nargs=0 Prettier :CocCommand prettier.formatFile

" lightline
let g:lightline = {}
let g:lightline.colorscheme = 'gruvbox'

" Vimtex
let g:tex_flavor = 'latex'

" Coc modules
let g:coc_global_extensions = [
	\ 'coc-snippets',
	\ 'coc-pairs',
	\ 'coc-emoji',
	\ 'coc-eslint',
	\ 'coc-prettier',
	\ 'coc-tsserver',
	\ 'coc-json',
	\ 'coc-omnisharp',
	\ 'coc-python',
	\ ]

" Nerd tree
map <leader>n :NERDTreeToggle<CR>
autocmd bufenter * if (winnr("$") == 1 && exists("b:NERDTree") && b:NERDTree.isTabTree()) | q | endif

" Runs a script that cleans out tex build files whenever I close out of a .tex file.
autocmd VimLeave *.tex !texclear %

" Save file as sudo on files that require root permission
cnoremap w!! execute 'silent! write !sudo tee % >/dev/null' <bar> edit!

" Automatically deletes all trailing whitespace on save.
autocmd BufWritePre * %s/\s\+$//e

" Update binds when sxhkdrc is updated.
autocmd BufWritePost *sxhkdrc !pkill -USR1 sxhkd
