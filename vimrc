syntax on
filetype plugin on
filetype indent on

"-------------------------------------------------------------
"Pathogen plugin plugin
"-------------------------------------------------------------
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

if has('gui_running')
    " GUI colors
    set background=dark 
    "colorscheme mac_classic 
    colorscheme xoria256 
    set guifont=Monaco:h14
else
    " Non-GUI (terminal) colors
endif


let mapleader=","

"-------------------------------------------------------------
"Vim Settings
"-------------------------------------------------------------
nmap <Leader>b :source $MYVIMRC
" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>v :e $MYVIMRC


set autochdir "auto change directories
set cpoptions+=$
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell           " don't beep
set noerrorbells         " don't beep
set hidden "Allows to change buffer w/o saving current buffer 
"-------------------------------------------------------------
"Search Settings
"-------------------------------------------------------------
set ignorecase
set smartcase
set incsearch
"replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
"-------------------------------------------------------------
"Motion Settings
"-------------------------------------------------------------
ino jj <esc>
cno jj <esc>
" Move the cursor to the window left of the current one
"noremap <silent> ,h :wincmd h<cr>
" " Move the cursor to the window below the current one
"noremap <silent> ,j :wincmd j<cr>
" " Move the cursor to the window above the current one
"noremap <silent> ,k :wincmd k<cr>
" " Move the cursor to the window right of the current one
"noremap <silent> ,l :wincmd l<cr>

"-------------------------------------------------------------
"Coding Settings
"-------------------------------------------------------------
set number
set hlsearch
":com Devall cd /Users/locojay/Documents/workspace 
"-------------------------------------------------------------
"Python Settings
"-------------------------------------------------------------
"start pydoc
map <buffer> <Leader>doc :execute "!pydoc " . expand("<cword>")<CR>
"python pep8 settings
autocmd FileType python setlocal textwidth=79
autocmd FileType python setlocal ts=8 sts=4 sw=4 expandtab
autocmd FileType python setlocal autoindent
"nose for unittest
autocmd FileType python compiler nose
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python set formatprg = PythonTidy

"""""""""" Preview window for python
fu! DoRunPyBuffer2()
pclose! " force preview window closed
setlocal ft=python
" copy the buffer into a new window, then run that buffer through python
sil %y a | below new | sil put a | sil %!python -
"indicate the output window as the current previewwindow
setlocal previewwindow ro nomodifiable nomodified
"back into the original window
winc p
endfu
command! RunPyBuffer call DoRunPyBuffer2()
map <Leader>p :RunPyBuffer<CR>

"-------------------------------------------------------------
"Latex Plugin Settings
"-------------------------------------------------------------
:let g:Tex_ViewRule_pdf = 'Preview'
"-------------------------------------------------------------
"NerdTree Plugin Settings
"-------------------------------------------------------------
let NERDTreeIgnore=['\.pyc$', '\.xls$']
nmap <silent> <D-d> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
:hi Title guifg=red guibg=#202020
"-------------------------------------------------------------
"Tlist Plugin Settings
"-------------------------------------------------------------
let Tlist_Use_Right_Window   = 1
nmap <silent> <D-k> :TlistToggle<CR>
"-------------------------------------------------------------
"Conque Plugin Settings
"-------------------------------------------------------------
nmap <silent> <D-i> :ConqueTermVSplit ipython<CR>
let g:ConqueTerm_SendVisKey = '<C-i>'
"-------------------------------------------------------------
"Omnifocus
"-------------------------------------------------------------
set completeopt=menu,preview
" omnifocus as constrol space
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif 
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
"-------------------------------------------------------------
"Snipmate Settings
"-------------------------------------------------------------
let g:snips_author = 'Jassin MEKNASSI'
"-------------------------------------------------------------
"PyFlakes Settings
"-------------------------------------------------------------
let g:pyflakes_use_quickfix = 0 
"-------------------------------------------------------------
"MinibufExplorer Plugin Settings
"-------------------------------------------------------------
let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

let g:miniBufExplTabWrap=1
let g:miniBufExplMaxSize=1
let g:miniBufExplorerMoreThanOne=0
let g:miniBufExplMapCTabSwitchBufs = 1
"turnoff minibufexpl
let loaded_minibufexplorer=1

"-------------------------------------------------------------
"Buftabs Plugin Settings
"-------------------------------------------------------------
let g:buftabs_in_statusline=1
":noremap <C-left> :bprev<CR>
:noremap <C-TAB> :bnext<CR>

"-------------------------------------------------------------
"Objective-J Settings
"-------------------------------------------------------------
function! MyFoldLevel( lineNumber )
  let thisLine = getline( a:lineNumber )
  " If the entire Javadoc comment or the {} pair is on one line, then don't create a fold for it.
  if ( thisLine =~ '\%(\%(/\*\*\).*\%(\*/\)\)\|\%({.*}\)' )
    return '='
  elseif ( thisLine =~ '\%(^\s*/\*\*\s*$\)\|{' )
    return "a1"
  elseif ( thisLine =~ '\%(^\s*\*/\s*$\)\|}' )
    return "s1"
  endif
  return '='
endfunction

"vim objj
set runtimepath+=~/.vim/bundle/vim-objj
"don't like highlighting of objj.vim ==> use objc
au BufNewFile,BufRead *.j  setfiletype objc
au BufNewFile,BufRead *.j  setlocal ts=8 sts=4 sw=4 expandtab
au BufNewFile,BufRead *.j setlocal foldexpr=MyFoldLevel(v:lnum)
au BufNewFile,BufRead *.j setlocal foldmethod=expr
"-------------------------------------------------------------
"AutoComplete Popup Plugin Settings
"-------------------------------------------------------------
map <Leader>ace :AcpEnable<CR>
map <Leader>acd :AcpDisable<CR>
"-------------------------------------------------------------
"taglist Settings
"-------------------------------------------------------------
"add objc to taglist
let tlist_objc_settings='objc;P:protocols;i:interfaces;I:implementations;M:instance methods;C:implementation methods;Z:protocol methods'
"-------------------------------------------------------------
"make green plugin
"-------------------------------------------------------------
map <Leader>nose :call MakeGreen()<CR> 
"-------------------------------------------------------------
"CommanT plugin
"-------------------------------------------------------------
nmap <Leader>t :CommandT<CR>
