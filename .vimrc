" Disable compatibility with vi
set nocompatible

" Setup correct colors for gnome-terminal
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Initialize vundle
filetype off
set rtp+=~/.vim/bundle/vundle/
call vundle#rc()

" Required
Bundle 'gmarik/vundle'

" Additional plugins
Bundle 'Lokaltog/vim-easymotion'
Bundle 'altercation/vim-colors-solarized'
Bundle 'corntrace/bufexplorer'
Bundle 'kien/ctrlp.vim'
Bundle 'tpope/vim-fugitive'
Bundle 'mileszs/ack.vim'
Bundle 'bling/vim-airline'

" Enable file type detection and indentation
filetype plugin indent on

" Set syntax highlighting and color scheme
let g:solarized_termtrans=1
colorscheme solarized
set background=dark

" Set Highlight column after textwidth
set colorcolumn=+1

" Disable line wrapping
set nowrap

" Enable the status line even if only one window is open
set laststatus=2

" Enable case insensitive search except when using capital letters
set incsearch
set ignorecase
set smartcase

" Display line numbers, highlight the cursor line and show position
set cursorline
set number
set ruler

" Setup completion options
set completeopt=menu,longest

" Enable movement commands to swap case
set tildeop

" Automatically reload a buffer on change
set autoread

let mapleader=','
let maplocalleader = '\\'

" Replace word under cursor with <leader>r
nnoremap <leader>r :%s/\<<C-r><C-w>\>/

" Use special powerline characters
let g:airline_powerline_fonts=1
  
" Disable detection of whitespace errors
let g:airline#extensions#whitespace#enabled=0
