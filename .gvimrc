"Vimrc by Dmitry Khodakov - 10.03.11
" todo: find-replace
"
set nocursorline
nmap <C-f> :promptr<CR>
imap <C-f> :promptr<CR>
vmap <C-f> :promptr<CR>
"------------------GUI-------
if has('gui')
  if has("win32") || has("win16")
    "set guifont=Consolas:h10:cRUSSIAN
    set guifont=Terminus:h14:cRUSSIAN
    colorscheme sashaDark
    behave mswin
    set keymodel-=stopsel
    set selection=inclusive
    let osys="windows"
    source $VIMRUNTIME/mswin.vim
  else
    colorscheme sashaDark
    "colorscheme desert
    "colorscheme koehler
    set guifont=Terminus\ 14
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
  " encoding features F8!
  map <F8> :emenu Encoding.<TAB>
  "-----------------IF WINDOWS----
  if has("win32") || has("win16")
  endif
endif
set nobackup       "no backup files
set nowritebackup  "only in case you don't want a backup file while editing
set noswapfile     "no swap files
