
"Vimrc by Dmitry Khodakov - 18.01.13
" for Nerdtree, Tagbar
" set tagbar_autofocus = 1
" set tagbar_compact = 1
" set tagbar_singleclick = 1
set completeopt=longest,menuone
nmap <F3> :TagbarOpen fjc<CR>
imap <F3> <Esc>:TagbarOpen fjc<CR>
vmap <F3> <Esc>:TagbarOpen fjc<CR>
nmap <F4> :TagbarToggle <CR>
imap <F4> <Esc>:TagbarToggle <CR>
vmap <F4> <Esc>:TagbarToggle <CR>
nmap <F5> :NERDTreeToggle <CR>
imap <F5> <Esc>:NERDTreeToggle <CR>
vmap <F5> <Esc>:NERDTreeToggle <CR>

nmap <F7> :call OpenTerm() <CR>
imap <F7> <Esc>:call OpenTerm()<CR>
vmap <F7> <Esc>:call OpenTerm() <CR>

func! OpenTerm()
  exec "sp"
  exec "resize +15"
  exec "wincmd j"
  exec "ConqueTerm bash"
endfunc
"------------------
" for google codestyle
"
" Размер отступов
set shiftwidth=2
" Размеры табуляций
set tabstop=2
set softtabstop=2
"set cursorline

"set textwidth=80
"disable wrap of string
set wrapmargin=0

nmap <C-j> :e . <CR>
imap <C-j> <Esc>:e .<CR>
vmap <C-j> <Esc>:e .<CR>
"--------------------
" HotKeys
" tab navigation
nmap <C-t> :tabnew<CR>
imap <C-t> <Esc>:tabnew<CR>
vmap <C-t> <Esc>:tabnew<CR>

:nmap <C-S-tab> :tabprevious<CR>
:nmap <C-tab> :tabnext<CR>
:map <C-S-tab> :tabprevious<CR>
:map <C-tab> :tabnext<CR>
:imap <C-S-tab> <Esc>:tabprevious<CR>i
:imap <C-tab> <Esc>:tabnext<CR>i

" show search highlight
:noremap <F6> :set hlsearch! hlsearch?<CR>

inoremap <C-Space> <C-n>
" comment line in python style
" TODO
" comment code c style
" 

" save
nmap <C-s> :w<CR>
imap <C-s> :w<CR>
vmap <C-s> :w<CR>

"highlight word under cursor
:autocmd CursorMoved * exe printf('match IncSearch /\V\<%s\>/', escape(expand('<cword>'), '/\'))

vnoremap # :s#^#\##<cr>
vnoremap -# :s#^\###<cr>

" PEP8
func! PythonAutoPEP8()
  exec "wa"
  exec "!autopep8 -i %"
endfunc
autocmd FileType python set tabstop=4 | set shiftwidth=4 |set expandtab
map <F10> :call PythonAutoPEP8()<CR>

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
" Open last active file(s) if VIM is invoked without arguments.
"make vim save and load the folding of the document each time it loads"
"also places the cursor in the last place that it was left."
"au BufWinLeave * mkview
"au BufWinEnter * silent loadview
" Go to last file if invoked without arguments.
autocmd VimEnter * nested if
  \ argc() == 0 &&
  \ bufname("%") == "" &&
  \ bufname("2" + 0) != "" |
  \   exe "normal! `0" |
  \ endif
" ----------------------------------------
"  Typical vim settings
"
set fileencoding=utf-8
set fileencodings=utf-8,cp1251

if has("win32") || has("win16")
  set ffs=dos,unix,mac
else
  set ffs=unix,dos,mac
endif  

syntax on 
set number
" Перенос длинных строк
"set wrap 
" ленивая перерисовка экрана при выполнении скриптов
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

" Always save some info for next time
set history=2000
set viminfo='200,h,%

" sound
set noerrorbells
set novisualbell
set t_vb=
set tm=500

" Автоматическое закрытие скобок
"imap [ []<LEFT>
"imap ( ()<LEFT>
"imap { {}<LEFT> 


"--------------------------------------------
" FILES
"
" Автоматическое переключение рабочей папки
set autochdir 
" Set to auto read when a file is changed from the outside
set autoread

" highlight extra whitespaces!
highlight ExtraWhitespace ctermbg=darkgreen guibg=darkgreen
match ExtraWhitespace /\s\+$/
autocmd BufWinEnter * match ExtraWhitespace /\s\+$/
autocmd InsertEnter * match ExtraWhitespace /\s\+\%#\@<!$/
autocmd InsertLeave * match ExtraWhitespace /\s\+$/
autocmd BufWinLeave * call clearmatches()


" Go to last file(s) if invoked without arguments.
autocmd VimLeave * nested if (!isdirectory($HOME . "/.vim")) |
    \ call mkdir($HOME . "/.vim") |
    \ endif |
    \ execute "mksession! " . $HOME . "/.vim/Session.vim"

autocmd VimEnter * nested if argc() == 0 && filereadable($HOME . "/.vim/Session.vim") |
    \ execute "source " . $HOME . "/.vim/Session.vim"

" Save on losing window focus
au FocusLost * :wa

" Try to show at least three lines and two columns of context when
" scrolling
set scrolloff=3
set sidescrolloff=2


" ----------------------------------------------------------------------------
"  Python

" For full syntax highlighting:
let python_highlight_all=1
syntax on

autocmd FileType python set omnifunc=pythoncomplete#Complete

" Automatically indent based on file type: ``
filetype indent on

" Folding based on indentation: 
"set foldmethod=indent

au BufEnter,BufRead *.py setlocal smartindent cinwords=if,elif,else,for,while,try,except,finally,def,class
filetype indent on
filetype on
filetype plugin on


" highlight variable under cursor (not smart)
" Python: yes
" C: yes
au BufRead,BufNewFile *.py,*.pyw,*.c  autocmd CursorMoved * silent! exe printf('match IncSearch /\<%s\>/', expand('<cword>'))


"-------------------------------------------------------
" Functions
" При создании нового файла *.py и *.pyw будут сразу добавлены два заголовка с
" путем до интерпретатора python и с указанием кодировки utf-8
function! BufNewFile_PY()
  0put = '#!/usr/bin/python'
  1put = '#-*- coding: utf-8 -*-'
  $put =
  normal G
endfunction

autocmd BufNewFile *.py call BufNewFile_PY()

" При создании нового файла *.c будут сразу добавлены два заголовка с
function! BufNewFile_C()
0put = '#include <stdio.h>'
1put = '#include <stdlib.h>'
3put = 'int main ( int argc, char *argv[])'
$put =
normal G
endfunction

autocmd BufNewFile *.c call BufNewFile_C()

" При создании нового файла *.cpp будут сразу добавлены два заголовка с
function! BufNewFile_CPP()
0put = '#include <iostream>'
1put = ''
2put = 'using namespace std;'
3put = ''
4put = 'int main ( int argc, char *argv[])'
5put = '{'
6put = '  return 0;'
7put = '}'
$put =
normal G
endfunction

autocmd BufNewFile *.cpp call BufNewFile_CPP()

func! RunPython()
  exec "wa"
  exec "!python3 %"
endfunc

func! PythonAutoPEP8()
  exec "wa"
  exec "!autopep8 -i %"
endfunc

set makeprg=make
compiler gcc
" -------- not used
func! CompileRunGcc()
  exec "w"
  exec "!g++ -Wall -g % -o %<"
  if has("win32") || has("win16")
    exec "!%<"
  else
    exec "! ./%<"
  endif
endfunc
" -------- not used
func! MakeTest()
  exec "wa"
  exec "!../make test"
endfunc

" -------- not used
func! CompileGcc()
  exec "w"
  exec "!g++ -Wall -g % -o %<"
endfunc

set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files

highlight CursorLine  cterm=NONE ctermbg=darkred ctermfg=NONE guibg=grey7 guifg=NONE

func! EnableHcul()
    hi CursorLine  cterm=NONE ctermbg=darkred ctermfg=NONE guibg=grey7 guifg=NONE
    set cul
endfunc
map <F11> :call EnableHcul()<CR>
autocmd BufWinEnter * call EnableHcul()
autocmd InsertEnter * call EnableHcul()
autocmd InsertLeave * call EnableHcul()
