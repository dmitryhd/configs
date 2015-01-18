" Vimrc by Dmitry Khodakov - 19.01.2015

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
set smartindent

set ffs=unix,dos,mac
set fileencoding=utf-8
set number

set autochdir
set autoread

" Folding
set foldmethod=indent
set foldlevelstart=99
set nofoldenable

set scrolloff=3   " Minimum lines to keep above and below cursor
set sidescrolloff=2

syntax on
filetype on
filetype plugin on

" no special files
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile
set noundofile

" ----------------------
" Section: Keymaps
" ----------------------
nmap <C-s> :w<CR>
imap <C-s> :w<CR>
vmap <C-s> :w<CR>

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
" Save on losing window focus
au FocusLost * :wa

" Go to last file(s) if invoked without arguments.
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"


" ----------------------
" Section: Plugins
" ----------------------
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1

" ----------------------
" Section: GVIM
" ----------------------
if has('gui_running')
    try
        colorscheme sashaDark
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
endif
