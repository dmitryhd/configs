"Vimrc by Dmitry Khodakov - 19.11.14

" for Nerdtree, Tagbar
" set tagbar_autofocus = 1
" set tagbar_compact = 1
" set tagbar_singleclick = 1

set nocompatible
filetype off  "обязательно!

set rtp+=~/.vim/bundle/vundle/
call vundle#rc()
"Bundle 'Lokaltog/vim-powerline'
Plugin 'bling/vim-airline'
Bundle 'tpope/vim-fugitive'
Plugin 'majutsushi/tagbar'
Plugin 'kien/ctrlp.vim'
Plugin 'scrooloose/syntastic'
if has("win32") || has("win16")
  set encoding=cp1251
  behave xterm
endif
source ~/.vimrc_functions

" ------------------ Airline
let g:airline_theme='solarized'
let g:airline_powerline_fonts = 1
let g:airline_enable_syntastic=1
let g:airline#extensions#tabline#enabled = 1
let g:airline#extensions#syntastic#enabled = 1
let g:airline#extensions#tagbar#enabled = 1

let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
let NERDTreeDirArrows=1
let NERDTreeShowHidden=1

set makeprg=python3\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
set efm=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m

let g:syntastic_python_python_exec = '/usr/bin/python3'
" тут будем добавлять наши расширения

filetype plugin indent on
"------------------
" CODE STYLE
"------------------
" РАЗМЕР отступов
set shiftwidth=2
" Размеры табуляций
set tabstop=2
set softtabstop=2
set completeopt=longest,menuone
" python pep 8!
autocmd Filetype python setlocal expandtab tabstop=4 shiftwidth=4 foldmethod=indent
autocmd Filetype html setlocal expandtab tabstop=4 shiftwidth=4 foldmethod=indent

"set textwidth=80
"disable wrap of string
set wrapmargin=0
set foldlevelstart=99
"highlight word under cursor
:autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

vnoremap # :s#^#\##<cr>
vnoremap -# :s#^\###<cr>

set viminfo='200,h,%
set history=1000                    " Store a ton of history (default is 20)
"set spell                           " Spell checking on
set shortmess+=filmnrxoOtT          " Abbrev. of messages (avoids 'hit enter')
if has('persistent_undo')
    set undofile                " So is persistent undo ...
    set undolevels=1000         " Maximum number of changes that can be undone
    set undoreload=10000        " Maximum number lines to save for undo on a buffer reload
endif
set ignorecase                  " Case insensitive search
set smartcase                   " Case sensitive when uc present
set scrolloff=3                 " Minimum lines to keep above and below cursor
set sidescrolloff=2

" Go to last file if invoked without arguments.
autocmd VimEnter * nested if
  \ argc() == 0 &&
  \ bufname("%") == "" &&
  \ bufname("2" + 0) != "" |
  \   exe "normal! `0" |
  \ endif
" Go to last file(s) if invoked without arguments.
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"

" Save on losing window focus
au FocusLost * :wa

set fileencoding=utf-8
"set fileencodings=utf-8,cp1251

if has("win32") || has("win16")
  set ffs=dos,unix,mac
else
  set ffs=unix,dos,mac
endif

set number
set lz
"set nocompatible
" включим автоотступы для новых строк
set ai
" включим отступы в стиле Си
set cin
set nowrap
set smarttab
set smartindent
" включим автозамену по умолчанию
set et
" Show full tags when doing search completion
set showfulltag
set showcmd

" sound
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Автоматическое переключение рабочей папки
set autochdir
" Set to auto read when a file is changed from the outside
set autoread

syntax on
filetype indent on
filetype on
filetype plugin on


" highlight extra whitespaces!
" highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
" match ExtraWhitespace /\s\+$/
" autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
" autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
" autocmd InsertLeave * match ExtraWhitespace /\s\+$/
" autocmd BufWinLeave * call clearmatches()

let python_highlight_all=1
" autocmd FileType python set omnifunc=pythoncomplete#te
au BufEnter,BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
"set foldmethod=indent " Folding based on indentation:
" highlight variable under cursor (not smart) " Python: yes " C: yes
au BufRead,BufNewFile *.py,*.pyw,*.c  autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))


"-----------------------------------------------
" VISUAL
"-----------------------------------------------
"------------------GUI-------
if has('gui_running')
  try
    colorscheme sashaDark
    "colorscheme desert
    "colorscheme sublime
    "colorscheme molokai-2
    "colorscheme koehler
  catch
    colorscheme desert
  endtry
  highlight ColorColumn guibg=#3f3f3f
  set colorcolumn=80

  "set cursorline
  set nocursorline
  if has("win32") || has("win16")
    try
      "set guifont=Consolas:h10:cRUSSIAN
      set guifont=Terminus:h12:cRUSSIAN
    catch
      set guifont=Consolas:h10:cRUSSIAN
    endtry
    set keymodel-=stopsel
    set selection=inclusive
    let osys="windows"
    source $VIMRUNTIME/mswin.vim
  else
    try
      set guifont=Terminess\ Powerline\ 10
    catch
      set guifont=Terminus\ 10
      "set guifont=DejaVu Sans Mono\ 10
    endtry
    set lines=52
    set columns=179
    winpos 0 20
  endif
  "----------------------
  set guioptions-=T
  set laststatus=2
  "set showmatch
  "======================
  "encoding change menu
  set wildmenu
  set wcm=<Tab>
  menu Encoding.CP1251   :e ++enc=cp1251<CR>
  menu Encoding.CP866    :e ++enc=cp866<CR>
  menu Encoding.KOI8-U   :e ++enc=koi8-u<CR>
  menu Encoding.UTF-8    :e ++enc=utf-8<CR>
  set lines=999 columns=999  " maximize window
else
  set nocursorline
  set term=xterm
endif

if has("win32") || has("win16")
  set backup
  set backupdir=C:\WINDOWS\Temp
  set backupskip=C:\WINDOWS\Temp\*
  set directory=C:\WINDOWS\Temp
  set writebackup
  set noundofile
else
  set nobackup       "no backup files
  set nowritebackup  "only in case you don't want a backup file while editing
  set noswapfile
  set noundofile
endif

"------------------
" Hotkeys
"------------------
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

noremap <F6> :set hlsearch! hlsearch?<CR>
inoremap <C-Space> <C
nmap <C-f> :promptr<CR>
imap <C-f> :promptr<CR>
vmap <C-f> :promptr<CR>

map <F1> :call OpenTerm(0) <CR>
imap <F1> <Esc>:call OpenTerm(0) <CR>
map <C-F1> :call OpenTerm(1) <CR>
imap <C-F1> <Esc>:call OpenTerm(1) <CR>
map <F2> :call RunMakeSequence() <CR>
imap <F2> <Esc>:call RunMakeSequence() <CR>
map <C-F2> :call RunCurrentTest() <CR>
imap <C-F2> <Esc>:call RunCurrentTest() <CR>
map <F3> :call ExecPythonScript(0) <CR>
imap <F3> <Esc>:call ExecPythonScript(0) <CR>
map <C-F8> :set cursorline!<CR>
map <F4> :call CheckStyle() <CR>
imap <F4> <Esc>:call CheckStyle() <CR>
map <F5> :call SwitchConsole() <CR>
imap <F5> <Esc>:call SwitchConsole() <CR>
map <F6> :call SwitchConsoleAndRunLastCommand() <CR>
imap <F6> <Esc>:call SwitchConsoleAndRunLastCommand() <CR>

" folding
" Fold all
map <S-F1> zM<CR>
" UnFold all
map <S-F2> zR<CR>
" UnFold all
map <S-F3> zA<CR>
map <F8> :!autopep8 -i %<CR>
map <F9> :TagbarToggle<CR>
map <F10> :NERDTreeFind<CR>
imap <F10> <Esc> :NERDTreeFind<CR>
map <F11> :silent !sudo service apache2 restart<CR>
map <F12> :e .<CR>

" delete all trailing whitespaces in python!
autocmd BufWritePre * call StripTrailingWhitespacePython()
highlight ColorColumn guibg=#3f3f3f
"set cursorline
