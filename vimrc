" Disable compatibility with vi
set nocompatible

" Initialize vundle
filetype off
set rtp+=~/.vim/bundle/Vundle.vim
set rtp+=~/.fzf
call vundle#begin()

" Required
Plugin 'VundleVim/Vundle.vim'

" Additional plugins
Plugin 'altercation/vim-colors-solarized'
Plugin 'ap/vim-buftabline'
Plugin 'embear/vim-localvimrc'
Plugin 'tpope/vim-abolish'
Plugin 'tpope/vim-fugitive'
Plugin 'tpope/vim-surround'
Plugin 'tpope/vim-unimpaired'

" Add all plugins before this line.
call vundle#end()

" Enable file type detection and indentation
filetype plugin indent on

" Enable syntax highlighting and set the number of colors for gnome-terminal
syntax enable
if $COLORTERM == 'gnome-terminal'
  set t_Co=256
endif

" Set the color scheme and any options
set background=dark
colorscheme solarized
let g:solarized_termtrans=1

" Automatically reload buffers that changed outside of vim
set autoread

" Enable backspace over autoindents, ends of lines, and the start of inserts
set backspace=indent,eol,start

" Disable preview window
set completeopt=menuone

" Highlight the cursor line and the column after textwidth
set cursorline colorcolumn=+1

" Ignore whitespace differences
set diffopt+=iwhite

" Disable automatic wrapping of text, but not comments
set formatoptions-=t

" Enable incremental searching and only match case when specified
set incsearch ignorecase smartcase

" Enable search highlighting
set hlsearch

" Always show the status line
set laststatus=2

" Disable redraws during macros
set lazyredraw

" Disable spaces when joining lines
set nojoinspaces

" Disable wrapping of text
set nowrap

" Show line numbers in margin and on status line
set number ruler

" Jump to matching bracket on insert
set showmatch
set matchtime=0

" Enable spell check in comments
set spell spelllang=en_us

" Always keep 3 lines of context around cursor
set scrolloff=3

" Set the default textwidth to 80 columns--may be overridden by ftplugins
set textwidth=80

let mapleader=','
let maplocalleader='\\'

" Alternative escape
inoremap jk <esc>

" Cycle through buffers
nnoremap <C-n> :bnext<CR>
nnoremap <C-p> :bprevious<CR>

" Edit $MYVIMRC
nnoremap <leader>ev :e $MYVIMRC<cr>
nnoremap <leader>em :e ~/.vimrc.machine<cr>

" Source $MYVIMRC
nnoremap <leader>sv :source $MYVIMRC<cr>

" Replace word under cursor
nnoremap <leader>r :%s/\<<c-r><c-w>\>/

" Convert selection to camel case
vnoremap <leader>cc :s/_\(\l\)/\u\1/g<cr>

" Pastes from clipboard
nnoremap <leader>p "+p

" Quit all windows with saving
nnoremap ZA :wqa<cr>

" Disable the arrow keys
noremap <Up> <NOP>
noremap <Down> <NOP>
noremap <Left> <NOP>
noremap <Right> <NOP>

" Strip white space on save
autocmd BufWritePre * call StripWhiteSpaces()
function! StripWhiteSpaces()
    let l:winview=winsaveview()
    :%s/\s\+$//e
    call winrestview(l:winview)
endfunction

" Load the machine specific vimrc
if filereadable(glob("~/.vimrc.machine"))
    source ~/.vimrc.machine
endif
