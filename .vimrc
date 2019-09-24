" Vimrc by Dmitry Khodakov - 02.03.2015
" ----------------------
" Section: Essential
" ----------------------

" tabsize
set shiftwidth=4
set tabstop=4
set softtabstop=4
set novisualbell
set expandtab  " always insert spaces
set autoindent
set nowrap
set smarttab

" for python
set nosmartindent

set ffs=unix,dos,mac
set fileencoding=utf-8
set number
set showcmd 
set autochdir
set autoread

set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set ignorecase 
set smartcase
set hlsearch            " highlight matches

syntax on
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile
set noundofile

nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
vmap <C-t> <Esc>:tabnew<CR>

nmap <C-S-tab> :tabprevious<CR>
nmap <C-tab> :tabnext<CR>
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
imap <C-S-tab> <Esc>:tabprevious<CR>i
imap <C-tab> <Esc>:tabnext<CR>i

au FocusLost * :wa

if has('gui_running')
    try
        colorscheme molokai  
    catch
        colorscheme desert
    endtry
    "set guifont=Terminus\ 10
    set guifont=Terminus\ \(TTF\)\ 12

    set guioptions-=T
    set guioptions-=m  "remove menu bar
    set guioptions-=r  "remove right scroll bar
    set guioptions-=L  "remove right scroll bar
    set lines=999 columns=999  " maximize window
    set showtabline=2 "always show tabline 
    " Highlight last column
    set colorcolumn=80
    highlight ColorColumn guibg=#3f3f3f
    set cursorline
else
    " console color scheme
    set t_Co=256
    try
        colorscheme molokai
    catch
        colorscheme desert
    endtry
endif
