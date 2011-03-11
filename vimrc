syntax on
filetype plugin on
filetype indent on

call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

set runtimepath+=~/.vim/bundle/vim-objj


if has('gui_running')
    " GUI colors
    set background=dark 
    "colorscheme mac_classic 
    colorscheme xoria256 
    set guifont=Monaco:h14
else
    " Non-GUI (terminal) colors
endif

"auto change directories
set autochdir

let mapleader=","

"""""""""""VIMRC Loading"""""""""""""""""""""""""""""""
nmap <Leader>b :source $MYVIMRC
" opens $MYVIMRC for editing, or use :tabedit $MYVIMRC
nmap <Leader>v :e $MYVIMRC
"""""""""""""""""""""""""""""""""""""""""""""""""""""""
set vb
set cpoptions+=$

""""""""""""search"""""""""""""""""""""""""""""""""""
set ignorecase
set smartcase
set incsearch
"""""""""""""""""""""""""""""""""""""""""""""""""""""
"replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/


ino jj <esc>
cno jj <esc>

" Move the cursor to the window left of the current one
"noremap <silent> ,h :wincmd h<cr>
"
" " Move the cursor to the window below the current one
"noremap <silent> ,j :wincmd j<cr>
"
" " Move the cursor to the window above the current one
"noremap <silent> ,k :wincmd k<cr>
"
" " Move the cursor to the window right of the current one
"noremap <silent> ,l :wincmd l<cr>


set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell           " don't beep
set noerrorbells         " don't beep


set hidden 

":com Devall cd /Users/locojay/Documents/workspace 
"SnipMate
let g:snips_author = 'Jassin MEKNASSI'
"pyflakes
let g:pyflakes_use_quickfix = 0 

let g:miniBufExplMapWindowNavVim = 1
let g:miniBufExplMapWindowNavArrows = 1
let g:miniBufExplMapCTabSwitchBufs = 1
let g:miniBufExplModSelTarget = 1

" Enable the python indent script
:syntax on
":set tabstop=4 shiftwidth=4 softtabstop=4 
"python pep8 settings
autocmd FileType python setlocal textwidth=79
autocmd FileType python setlocal ts=8 sts=4 sw=4 expandtab
autocmd FileType python setlocal autoindent

"Objective-J
au BufNewFile,BufRead *.j,Jakefile setf objj
au BufNewFile,BufRead *.j  setlocal ts=8 sts=4 sw=4 expandtab
"Preview
:let g:Tex_ViewRule_pdf = 'Preview'

" Enable the python syntax script
"autocmd FileType python set complete+=k~/.vim/syntax/python.vim isk+=.,(
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType python map <D-r> :w<CR>:!python %<CR><CR>
autocmd FileType python set number
autocmd FileType python set hlsearch
"autocmd FileType python set formatprg = PythonTidy

"java
autocmd FileType java set foldmethod=syntax
"NERDTree
let NERDTreeIgnore=['\.pyc$', '\.xls$']
nmap <silent> <D-d> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
:hi Title guifg=red guibg=#202020
"TagList
let Tlist_Use_Right_Window   = 1
nmap <silent> <D-k> :TlistToggle<CR>

"conque
nmap <silent> <D-i> :ConqueTermVSplit ipython<CR>
let g:ConqueTerm_SendVisKey = '<C-i>'



" omnifocus as constrol space
autocmd CursorMovedI * if pumvisible() == 0|pclose|endif 
autocmd InsertLeave * if pumvisible() == 0|pclose|endif
inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
            \ "\<lt>C-n>" :
            \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
            \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
            \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
imap <C-@> <C-Space>
let OmniCpp_SelectFirstItem = 0

" Preview window for python
fu! DoRunPyBuffer2()
pclose! " force preview window closed
setlocal ft=python
"
" " copy the buffer into a new window, then run that buffer through python
sil %y a | below new | sil put a | sil %!python -
" " indicate the output window as the current previewwindow
setlocal previewwindow ro nomodifiable nomodified
"
" " back into the original window
winc p
endfu
command! RunPyBuffer call DoRunPyBuffer2()
map <Leader>p :RunPyBuffer<CR>

"no arrow keys

"noremap  <Up> ""
"noremap! <Up> <Esc>
"noremap  <Down> ""
"noremap! <Down> <Esc>
"noremap  <Left> ""
"noremap! <Left> <Esc>
"noremap  <Right> ""
"noremap! <Right> <Esc>
