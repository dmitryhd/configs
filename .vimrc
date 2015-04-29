" Vimrc by Dmitry Khodakov - 02.03.2015

" snipmate is great!

" ----------------------
" Section: Essential
" ----------------------

" tabsize
set shiftwidth=4
set tabstop=4
set softtabstop=4
set expandtab  " always insert spaces
set autoindent
set nowrap
set smarttab

" for python
"set nosmartindent

set ffs=unix,dos,mac
set fileencoding=utf-8
set number
set showcmd 
set autochdir
set autoread

set ruler	" Show row and column ruler information
set autowriteall	" Auto-write all file changes

set cursorline

set wildmenu " visual autocomplete for command menu
set lazyredraw          " redraw only when we need to.
set showmatch           " highlight matching [{()}]
set incsearch           " search as characters are entered
set hlsearch            " highlight matches

set novisualbell

 
" Folding
set foldmethod=indent
set foldlevelstart=99
set nofoldenable

set scrolloff=3   " Minimum lines to keep above and below cursor
set sidescrolloff=2

syntax on
filetype on                          " try to detect filetypes
filetype plugin indent on    " enable loading indent file for filetype

" no special files
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile
set noundofile

" ----------------------
" Section: Keymaps
" ----------------------
let mapleader=','

nnoremap <leader>q :wq <CR>
nnoremap <leader>a :wqa <CR>
nnoremap <leader>w :wa <CR>
nnoremap <leader>e :e .<CR>
nnoremap <leader>v :vsplit .<CR>

nnoremap <C-J> <C-W><C-J>
nnoremap <C-K> <C-W><C-K>
nnoremap <C-L> <C-W><C-L>
nnoremap <C-H> <C-W><C-H>

nmap <C-s> :wa<CR>
imap <C-s> :wa<CR>
vmap <C-s> :wa<CR>

" tab navigation
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
vmap <C-t> <Esc>:tabnew<CR>

nmap <C-S-tab> :tabprevious<CR>
nmap <C-tab> :tabnext<CR>
map <C-S-tab> :tabprevious<CR>
map <C-tab> :tabnext<CR>
imap <C-S-tab> <Esc>:tabprevious<CR>i
imap <C-tab> <Esc>:tabnext<CR>i

map <F10> :NERDTreeFind<CR>
imap <F10> <Esc> :NERDTreeFind<CR>
map <F11> :silent !sudo service apache2 restart<CR>
map <F12> :e .<CR>

" ----------------------
" Section: Actions
" ----------------------
au BufRead,BufNewFile *.md set filetype=markdown
" Save on losing window focus
au FocusLost * :wa

" Go to last file(s) if invoked without arguments.
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"

" Highlight word under cursor
autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))
" ----------------------
" Section: Plugins
" ----------------------
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1

au FileType python set omnifunc=pythoncomplete#Complete
let g:SuperTabDefaultCompletionType = "context"

nnoremap <leader>t :CommandT <CR>
map <leader>j :RopeGotoDefinition<CR>
map <leader>r :RopeRename<CR>
" ----------------------
" Section: GVIM
" ----------------------
if has('gui_running')
    try
        "colorscheme BusyBee  
        "colorscheme solarized  
        "colorscheme badwolf  
        
        "colorscheme sashaDark
        "colorscheme gruvbox  
        "colorscheme hybrid
        colorscheme molokai  
        "colorscheme railscasts  
        "colorscheme sublime  
        "colorscheme codeschool  
        "colorscheme zenburn
    catch
        colorscheme desert
    endtry
    set guifont=Terminus\ 10
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
endif

" ----------------------
" Section: Scripts
" ----------------------
function! InsertPythonTest() 
    r~/.vim/templates/python_test.py
endfunction

function! InsertPythonMain() 
    r~/.vim/templates/python_main.py
endfunction

function! InsertPythonColorPrint() 
    r~/.vim/templates/python_color_print.py
endfunction

function! TrailingSpaces()
    %s/\s\+$//
endfunction
