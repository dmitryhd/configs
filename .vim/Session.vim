let SessionLoad = 1
if &cp | set nocp | endif
let s:cpo_save=&cpo
set cpo&vim
imap <F10>  :NERDTreeFind
imap <F6> :call SwitchConsoleAndRunLastCommand() 
imap <F5> :call SwitchConsole() 
imap <F4> :call CheckStyle() 
imap <F3> :call ExecPythonScript(0) 
imap <C-F2> :call RunCurrentTest() 
imap <F2> :call RunMakeSequence() 
imap <C-F1> :call OpenTerm(1) 
imap <F1> :call OpenTerm(0) 
inoremap <C-Space> <C
imap <C-Tab> :tabnexti
imap <C-S-Tab> :tabpreviousi
map! <S-Insert> <MiddleMouse>
vmap  :promptr
nmap  :promptr
nnoremap <silent>  :CtrlP
vmap  :w
nmap  :w
vmap  :tabnew
nmap  :tabnew
vnoremap # :s#^#\##
vnoremap -# :s#^\###
nmap gx <Plug>NetrwBrowseX
nnoremap <silent> <Plug>NetrwBrowseX :call netrw#NetrwBrowseX(expand("<cWORD>"),0)
map <F12> :e .
map <F11> :silent !sudo service apache2 restart
map <F10> :NERDTreeFind
map <F9> :TagbarToggle
map <F8> :!autopep8 -i %
map <S-F3> zA
map <S-F2> zR
map <S-F1> zM
map <F5> :call SwitchConsole() 
map <F4> :call CheckStyle() 
map <C-F8> :set cursorline!
map <F3> :call ExecPythonScript(0) 
map <C-F2> :call RunCurrentTest() 
map <F2> :call RunMakeSequence() 
map <C-F1> :call OpenTerm(1) 
map <F1> :call OpenTerm(0) 
map <F6> :call SwitchConsoleAndRunLastCommand() 
map <C-Tab> :tabnext
map <C-S-Tab> :tabprevious
map <S-Insert> <MiddleMouse>
imap  :promptr
imap  :w
imap  :tabnew
let &cpo=s:cpo_save
unlet s:cpo_save
set autochdir
set autoindent
set autoread
set background=dark
set backspace=indent,eol,start
set cindent
set completeopt=longest,menuone
set errorformat=%C\ %.%#,%A\ \ File\ \"%f\"\\,\ line\ %l%.%#,%Z%[%^\ ]%\\@=%m
set expandtab
set fileencodings=ucs-bom,utf-8,default,latin1
set fileformats=unix,dos,mac
set foldlevelstart=99
set guifont=Terminess\ Powerline\ 10
set guioptions=agimrLt
set helplang=en
set history=1000
set ignorecase
set iminsert=0
set laststatus=2
set lazyredraw
set makeprg=python3\ -c\ \"import\ py_compile,sys;\ sys.stderr=sys.stdout;\ py_compile.compile(r'%')\"
set nomodeline
set mouse=a
set printoptions=paper:a4
set ruler
set runtimepath=~/.vim,~/.vim/bundle/vim-airline,~/.vim/bundle/vim-fugitive,~/.vim/bundle/tagbar,~/.vim/bundle/ctrlp.vim,~/.vim/bundle/syntastic,/var/lib/vim/addons,/usr/share/vim/vimfiles,/usr/share/vim/vim74,/usr/share/vim/vimfiles/after,/var/lib/vim/addons/after,~/.vim/after,~/.vim/bundle/vundle/,~/.vim/bundle/vim-airline/after,~/.vim/bundle/vim-fugitive/after,~/.vim/bundle/tagbar/after,~/.vim/bundle/ctrlp.vim/after,~/.vim/bundle/syntastic/after
set scrolloff=3
set shiftwidth=2
set shortmess=filmnrxoOtT
set showcmd
set showfulltag
set showtabline=2
set sidescrolloff=2
set smartcase
set smartindent
set smarttab
set softtabstop=2
set suffixes=.bak,~,.swp,.o,.info,.aux,.log,.dvi,.bbl,.blg,.brf,.cb,.ind,.idx,.ilg,.inx,.out,.toc
set noswapfile
set tabline=%!airline#extensions#tabline#get()
set tabstop=2
set termencoding=utf-8
set timeoutlen=500
set viminfo='200,h,%
set wildcharm=<Tab>
set wildmenu
set nowritebackup
let s:so_save = &so | let s:siso_save = &siso | set so=0 siso=0
let v:this_session=expand("<sfile>:p")
silent only
cd /etc/apache2
if expand('%') == '' && !&modified && line('$') <= 1 && getline(1) == ''
  let s:wipebuf = bufnr('%')
endif
set shortmess=aoO
badd +7 /etc/gitlab/gitlab.rb
badd +5 /etc/apache2/ports.conf
badd +15 /etc/apache2/sites-available/nms.conf
args /etc/gitlab/gitlab.rb
edit /etc/apache2/ports.conf
set splitbelow splitright
set nosplitbelow
set nosplitright
wincmd t
set winheight=1 winwidth=1
argglobal
setlocal keymap=
setlocal noarabic
setlocal autoindent
setlocal balloonexpr=
setlocal nobinary
setlocal bufhidden=
setlocal buflisted
setlocal buftype=
setlocal cindent
setlocal cinkeys=0{,0},0),:,0#,!^F,o,O,e
setlocal cinoptions=
setlocal cinwords=if,else,while,do,for,switch
set colorcolumn=80
setlocal colorcolumn=80
setlocal comments=s1:/*,mb:*,ex:*/,://,b:#,:%,:XCOMM,n:>,fb:-
setlocal commentstring=/*%s*/
setlocal complete=.,w,b,u,t,i
setlocal concealcursor=
setlocal conceallevel=0
setlocal completefunc=
setlocal nocopyindent
setlocal cryptmethod=
setlocal nocursorbind
setlocal nocursorcolumn
setlocal nocursorline
setlocal define=
setlocal dictionary=
setlocal nodiff
setlocal equalprg=
setlocal errorformat=
setlocal expandtab
if &filetype != 'apache'
setlocal filetype=apache
endif
setlocal foldcolumn=0
setlocal foldenable
setlocal foldexpr=0
setlocal foldignore=#
setlocal foldlevel=99
setlocal foldmarker={{{,}}}
setlocal foldmethod=manual
setlocal foldminlines=1
setlocal foldnestmax=20
setlocal foldtext=foldtext()
setlocal formatexpr=
setlocal formatoptions=tcq
setlocal formatlistpat=^\\s*\\d\\+[\\]:.)}\\t\ ]\\s*
setlocal grepprg=
setlocal iminsert=0
setlocal imsearch=2
setlocal include=
setlocal includeexpr=
setlocal indentexpr=
setlocal indentkeys=0{,0},:,0#,!^F,o,O,e
setlocal noinfercase
setlocal iskeyword=@,48-57,_,192-255
setlocal keywordprg=
setlocal nolinebreak
setlocal nolisp
setlocal nolist
setlocal makeprg=
setlocal matchpairs=(:),{:},[:]
setlocal nomodeline
setlocal modifiable
setlocal nrformats=octal,hex
set number
setlocal number
setlocal numberwidth=4
setlocal omnifunc=
setlocal path=
setlocal nopreserveindent
setlocal nopreviewwindow
setlocal quoteescape=\\
setlocal noreadonly
setlocal norelativenumber
setlocal norightleft
setlocal rightleftcmd=search
setlocal noscrollbind
setlocal shiftwidth=2
setlocal noshortname
setlocal smartindent
setlocal softtabstop=2
setlocal nospell
setlocal spellcapcheck=[.?!]\\_[\\])'\"\	\ ]\\+
setlocal spellfile=
setlocal spelllang=en
setlocal statusline=%!airline#statusline(1)
setlocal suffixesadd=
setlocal noswapfile
setlocal synmaxcol=3000
if &syntax != 'apache'
setlocal syntax=apache
endif
setlocal tabstop=2
setlocal tags=
setlocal textwidth=0
setlocal thesaurus=
setlocal noundofile
setlocal nowinfixheight
setlocal nowinfixwidth
set nowrap
setlocal nowrap
setlocal wrapmargin=0
silent! normal! zE
let s:l = 5 - ((4 * winheight(0) + 35) / 70)
if s:l < 1 | let s:l = 1 | endif
exe s:l
normal! zt
5
normal! 0
tabnext 1
if exists('s:wipebuf')
  silent exe 'bwipe ' . s:wipebuf
endif
unlet! s:wipebuf
set winheight=1 winwidth=20 shortmess=filmnrxoOtT
let s:sx = expand("<sfile>:p:r")."x.vim"
if file_readable(s:sx)
  exe "source " . fnameescape(s:sx)
endif
let &so = s:so_save | let &siso = s:siso_save
doautoall SessionLoadPost
unlet SessionLoad
" vim: set ft=vim :
