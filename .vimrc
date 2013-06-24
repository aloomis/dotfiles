call pathogen#infect()

" Disable compatibility with vi
set nocompatible

if has('gui_running')
    set guioptions-=T " Disable toolbar
    set guioptions-=r " Disable scrollbar
    set guifont=Andale\ Mono\ 13
endif

" Enable file type detection and indentation
filetype plugin indent on

" Set syntax highlighting and color scheme
syntax enable
let g:solarized_termtrans=1
colorscheme solarized
set background=dark

" Enable doxygen syntax highlighting
let g:load_doxygen_syntax=1

" Disable the creation of backup files
set nobackup
set nowritebackup

" Keep changes to buffer without writing
set hidden

" Enable the mouse in all modes
set mouse=a

" Enable the status line even if only one window is open
set laststatus=2

" Show the current mode on the last line
set showmode

" Disable all error bells and visual beeps
set noerrorbells
set novisualbell

" Enable automatic indentation and tab behavior
set autoindent
set expandtab
set softtabstop=4
set shiftwidth=4

" Enable search term highlighting and incremental search
set hlsearch
set incsearch

" Enable case insensitive search except when using capital letters
set ignorecase
set smartcase

" Enable enhanced command line completion
set wildmenu
set wildmode=list:longest
set wildignore=*.o,moc_*.cpp,*targetfs*

" Automatically read a file that is changed outside of vim
set autoread

" Set scrolling options
set sidescroll=1
set sidescrolloff=3
set scrolloff=3

" Make backspace work normally
set backspace=2

" Disable syntax based folding by default
set nofoldenable
set foldmethod=manual
set foldnestmax=1

" Set the text width for formatting operations
set textwidth=78

" Disable wrapping lines and automatic insertion of line breaks
set nowrap
set formatoptions-=t

" Highlight the matching brace immediately
set showmatch
set matchtime=0

" Setup c/cpp specific formating options
set cino=l1,g0,N-s,:0

" Enable spell check by default
"set spell spelllang=en_us

" Disable redraw in the middle of a macro
set lazyredraw

" Ignore whitespace when using vimdiff
set diffopt+=iwhite

" Display line numbers, highlight the cursor line and show position
set cursorline
set number
set ruler

" Set paste toggle mode to F9
set pastetoggle=<F9>

" Setup completion options
set completeopt=menu,menuone
set pumheight=10

" Setup conceal options
set conceallevel=2
set concealcursor=nvi

" Enable movement commands to swap case
set tildeop

" Configure clang complete
let g:clang_debug=1
let g:clang_complete_copen=1
let g:clang_hl_errors=1
let g:clang_auto_select=1
let g:clang_auto_complete=1
let g:clang_close_preview=1
let g:clang_snippets=1
let g:clang_use_library=1

" Change the leader key to ,
let mapleader=','

" Disable search highlighting with <leader>n
nnoremap <silent> <leader>n :silent :nohlsearch<CR>

" Replace word under cursor with <leader>s
nnoremap <leader>s :%s/\<<C-r><C-w>\>/

" Select buffer from list
noremap <F5> :buffers<CR>:buffer<Space>

" Toggle between header and source with <leader>f
nnoremap <leader>f :call FSwitch('%','') <bar> cd .<CR>

augroup mycppfiles
   au BufEnter *.hpp let b:fswitchdst  = 'cpp'
   au BufEnter *.hpp let b:fswitchlocs  = '.'
   au BufEnter *.cpp let b:fswitchdst  = 'hpp,h'
   au BufEnter *.cpp let b:fswitchlocs  = '.'
augroup end

" Make redraw screen also disable highlight
nnoremap <C-L> :nohl<CR><C-L>

" Save a file using sudo
cmap w!! %!sudo tee > /dev/null %

" Check syntax using clang
map <F10> :call g:ClangUpdateQuickFix()<CR>

" Print the highlight groups of the element under the cursor
nnoremap <F12> :call PrintHighlightGroup() <CR>

" Disable expandtab for makefiles
autocmd FileType make setlocal noexpandtab tabstop=4

" Set default compiler for cpp files to gcc
autocmd FileType cpp compiler gcc

" Set automatic insertion of line breaks for tex files
autocmd FileType tex setlocal formatoptions+=t

" Highlight doxygen files like c++ files
autocmd BufRead,BufNewFile *.dox setlocal filetype=cpp

" Automatically open the quickfix/location list window
autocmd QuickFixCmdPost [^l]* nested cwindow
autocmd QuickFixCmdPost l* nested lwindow

" Useful for shell commands like make
command! -nargs=1 Silent | execute ':silent !'.<q-args> | execute ':redraw!'

" Rescan buffer to correct syntax highlighting
autocmd BufEnter * :syntax sync fromstart

" Strip white space on save
autocmd BufWritePre * call StripWhiteSpaces()

" Strip white space at the end of lines
function! StripWhiteSpaces()
    let l:winview = winsaveview()
    :%s/\s\+$//e
    call winrestview(l:winview)
endfunction

" Print the highlight group under the cursor
function! PrintHighlightGroup()
    let hi = synIDattr(synID(line('.'),col('.'),1),'name')
    let trans = synIDattr(synID(line('.'),col('.'),0),'name')
    let lo = synIDattr(synIDtrans(synID(line('.'),col('.'),1)),'name')
    :echo 'hi<'.hi.'> trans<'.trans.'> lo<'.lo.'>'
endfunction

" Make some small changes to syntax highlighting
hi link doxygenParamDirection doxygenParam
hi search cterm=underline gui=underline

