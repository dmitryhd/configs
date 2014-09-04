" Vimrc by Dmitry Khodakov - 10.03.11
" todo: find-replace
"
"------------------GUI-------
if has('gui')
  if has("win32") || has("win16")
    try
      "set guifont=Consolas:h10:cRUSSIAN
      set guifont=Terminus:h14:cRUSSIAN
    catch
      set guifont=Consolas:h10:cRUSSIAN
    endtry
    set keymodel-=stopsel
    set selection=inclusive
    let osys="windows"
    source $VIMRUNTIME/mswin.vim
  else
    try
      set guifont=Terminus\ 10
    catch
      set guifont=DejaVu Sans Mono\ 10
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
endif
