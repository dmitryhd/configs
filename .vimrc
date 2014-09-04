"Vimrc by Dmitry Khodakov - 04.09.14

" for Nerdtree, Tagbar
" set tagbar_autofocus = 1
" set tagbar_compact = 1
" set tagbar_singleclick = 1

source ~/.vimrc_functions

"------------------
" CODE STYLE
"------------------
" Размер отступов
set shiftwidth=2
" Размеры табуляций
set tabstop=2
set softtabstop=2
set completeopt=longest,menuone

"set textwidth=80
"disable wrap of string
set wrapmargin=0

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
set fileencodings=utf-8,cp1251

if has("win32") || has("win16")
  set ffs=dos,unix,mac
else
  set ffs=unix,dos,mac
endif  

set number
set lz 
set nocompatible      
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

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

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

autocmd BufNewFile *.py call BufNewFile_PY()
autocmd BufNewFile *.c call BufNewFile_C()

" При создании нового файла *.cpp будут сразу добавлены два заголовка с

autocmd BufNewFile *.cpp call BufNewFile_CPP()

"------------------
" Hotkeys
"------------------
nmap <F1> :call SeeCurrentWd()<CR>
imap <F1> <Esc>:call SeeCurrentWd()<CR>
nmap <F2> :call MyTagbarSwitch()<CR>
imap <F2> <Esc>:call MyTagbarSwitch()<CR>
nmap <F3> :call CloseOpenTermVert() <CR>
imap <F3> <Esc>:call CloseOpenTermVert()<CR>
nmap <F4> :call SwitchTerm()<CR>
imap <F4> <Esc>:call SwitchTerm()<CR>
nmap <F5> :NERDTreeToggle <CR>
imap <F5> <Esc>:NERDTreeToggle <CR>

map <F7> :call RunReplace() <CR>
imap <F7> <Esc>:call RunReplace() <CR>
nmap <F12> :call PythonPylintCheck() <CR>
imap <F12> <Esc>:call PythonPylintCheck() <CR>
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

:noremap <F6> :set hlsearch! hlsearch?<CR>
inoremap <C-Space> <C
nmap <C-f> :promptr<CR>
imap <C-f> :promptr<CR>
vmap <C-f> :promptr<CR>

map <C-A-t> :call OpenTermHoriz() <CR>
map <C-A-v> :call OpenTermVert() <CR>
map <C-A-r> :call ExecPythonScript() <CR>
map <C-A-f> :call DebugPythonScriptVert() <CR>
map <C-A-e> :call ExecPythonScriptVert() <CR>
map <C-A-d> :call DebugPythonScript() <CR>
map <C-A-q> :call CloseTab() <CR>
imap <C-A-q> <Esc>:call CloseTab() <CR>
map <C-A-h> :set cursorline!<CR>

try
  "colorscheme sashaDark
  colorscheme desert
  "colorscheme sublime
  "colorscheme molokai-2
  "colorscheme koehler
catch
  echo "An error occurred.  Execution should be stopped . . ."
  colorscheme desert
endtry
set cursorline
