"-------------------------------------------------------------
"Pathogen plugin plugin
"-------------------------------------------------------------
" To disable a plugin, add it's bundle name to the following list
let g:pathogen_disabled = []
if !has('python')
    call add(g:pathogen_disabled, 'pythonhelper')
    call add(g:pathogen_disabled, 'pyflakes-vim')
    call add(g:pathogen_disabled, 'python_pep8')
    call add(g:pathogen_disabled, 'pysmell')
    call add(g:pathogen_disabled, 'python_open_module')
    call add(g:pathogen_disabled, 'ropevim')
endif
if !has('ruby')
    call add(g:pathogen_disabled, 'lusty')
endif
"call add(g:pathogen_disabled, 'ropevim')
"call add(g:pathogen_disabled, 'pysmell')
"call add(g:pathogen_disabled, 'vim-neocomplcache')
call add(g:pathogen_disabled, 'AutoComplPop')
call add(g:pathogen_disabled, 'csv.vim')
call add(g:pathogen_disabled, 'supertab')
call add(g:pathogen_disabled, 'buftabs')
call add(g:pathogen_disabled, 'vim-fuzzyfinder-pathogen')
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()

"-----------------------------------------------------------------------------
" Set up the window colors and size
"-----------------------------------------------------------------------------
if has('gui_running')
    " GUI colors
    colorscheme jellybeans
    set guifont=Monaco:h12
    "set guioptions=egmrt
    "set guioptions+=T
    winpos 0 0
    winsize 270 70
    set go-=L
    set go-=r
"elseif $TERM_PROGRAM == "iTerm.app"
elseif $TERM == "xterm-256color" || $TERM == "screen-256color"
    " Non-GUI (terminal) colors
    set t_Co=256
    colorscheme jellybeans
    set guifont=Monaco:h12
    "colorscheme xoria256
    autocmd colorscheme * hi Normal ctermbg=233
    autocmd colorscheme * hi NonText ctermbg=233
    autocmd colorscheme * hi LineNr ctermbg=233
    autocmd colorscheme * hi VertSplit ctermbg=233
endif

syntax on
filetype plugin on
filetype indent on

set noswapfile
let mapleader=","
"-------------------------------------------------------------
"Vim Settings
"-------------------------------------------------------------
"read large files
au BufReadPost * if getfsize(bufname("%")) > 512*1024 | set syntax=| set filetype=| endif
"paste mode
nnoremap <F5> :set invpaste paste?<CR>
set pastetoggle=<F5>
set showmode
" Set the status line the way i like it
"set stl=%f\ %m\ %r\ Line:%l/%L[%p%%]\ Col:%c\ Buf:%n\ [%b][0x%B]
"set statusline=%<\ %n:%f\ %m%r%y%w%=%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
set statusline=%<\ %n:%f\ %m%r%y%w%=%{VirtualEnvStatusline()}%-35.(line:\ %l\ of\ %L,\ col:\ %c%V\ (%P)%)
" tell VIM to always put a status line in, even if there is only one window
"set laststatus=2

"keep a longer history
set history=1000

set wildmode=longest:full
set wildmenu
" Buffer commands
noremap <silent> <Leader>bd :bd<CR>
noremap <silent> <Leader>bn :bn<CR>
noremap <silent> <Leader>bp :bp<CR>

noremap <silent> <Leader>tp :tabprevious<CR>
noremap <silent> <Leader>tn :tabnext<CR>
" Edit the vimrc file
nmap <silent> <Leader>ev :e $MYVIMRC<CR>
nmap <silent> <Leader>sv :so $MYVIMRC<CR>
"quick save
"noremap <silent> <Leader>w :w<CR>

" When pressing <leader>cd switch to the directory of the open buffer
map <silent><Leader>cd :cd %:p:h<CR>
map <silent><Leader>noh :noh<CR>
"set autochdir "auto change directories
set cpoptions+=$
set wildignore=*.swp,*.bak,*.pyc,*.class
set visualbell           " don't beep
set noerrorbells         " don't beep
set hidden "Allows to change buffer w/o saving current buffer
"Move lines up and down
nnoremap <D-j> :m+<CR>==
nnoremap <D-k>  :m-2<CR>==
inoremap <D-j>  <Esc>:m+<CR>==gi
inoremap <D-k>  <Esc>:m-2<CR>==gi
vnoremap <D-j>  :m'>+<CR>gv=gv
vnoremap <D-k>  :m-2<CR>gv=gv
"windows
" Move the cursor to the window left of the current one
noremap <silent> ,wh :wincmd h<cr>
" Move the cursor to the window below the current one
noremap <silent> ,wj :wincmd j<cr>
" Move the cursor to the window above the current one
noremap <silent> ,wk :wincmd k<cr>
" Move the cursor to the window right of the current one
noremap <silent> ,wl :wincmd l<cr>

noremap <silent> ,cj :wincmd j<CR>:close<CR>
noremap <silent> ,ck :wincmd k<CR>:close<CR>
noremap <silent> ,ch :wincmd h<CR>:close<CR>
noremap <silent> ,cl :wincmd l<CR>:close<CR>
noremap <silent> ,cc :wincmd c<CR>:close<CR>

noremap <silent> ,wr :wincmd r<CR>
noremap <silent> ,wo :wincmd o<CR>
noremap <silent> ,wx :wincmd x<CR>
noremap <silent> ,ww :wincmd w<CR>

noremap <silent> ,vs :vsplit <CR>
noremap <silent> ,hs :split <CR>
"quickfix winow
noremap <silent> ,cn :cn<CR>
noremap <silent> ,cp :cp<CR

""""""""""""""
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
noremap <silent> <Leader>cj :wincmd j<CR>:close<CR>
noremap <silent> <Leader>ck :wincmd k<CR>:close<CR>
noremap <silent> <Leader>ch :wincmd h<CR>:close<CR>
noremap <silent> <Leader>cl :wincmd l<CR>:close<CR>

"remove trailing whitespaces
autocmd BufWritePre * :%s/\s\+$//e
autocmd BufWritePre *.py :1,6s/T_IMESTAMP/TIMESTAMP/e
"-------------------------------------------------------------
"Coding Settings
"-------------------------------------------------------------
set number
set hlsearch
":com Devall cd /Users/locojay/Documents/workspace
"-------------------------------------------------------------
"R Settings
"-------------------------------------------------------------
autocmd FileType r setlocal ts=8 sts=4 sw=4 expandtab
"-------------------------------------------------------------
"Python Settings
"-------------------------------------------------------------
"start pydoc
map <buffer> <Leader>doc :execute "!pydoc " . expand("<cword>")<CR>
"python pep8 settings
"autocmd FileType python setlocal textwidth=79
autocmd FileType python setlocal ts=8 sts=4 sw=4 expandtab
autocmd FileType python setlocal autoindent
"nose for unittest
autocmd FileType python compiler nose
autocmd FileType python set omnifunc=pythoncomplete#Complete
"autocmd FileType python set formatprg = PythonTidy
"autocmd! bufwritepost *.py %!PythonTidy

function! PythonTidySaver()
	let oldpos=getpos('.')
	%!PythonTidy
	call setpos('.',oldpos)
endfunction

"autocmd! bufwritepost *.py call PythonTidySaver()
autocmd FileType python map <buffer> <Leader>p :call Pep8()<CR>
autocmd BufNewFile,BufRead *.py set formatprg=PythonTidy
"pythontags
map \pyt :exe '!ctags -R --languages=python -f ./pytags ' . system('python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"')<CR>

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
autocmd FileType python map <Leader>r :RunPyBuffer<CR>
"-------------------------------------------------------------
"Latex Plugin Settings
"-------------------------------------------------------------
autocmd FileType tex setlocal ts=8 sts=4 sw=4 expandtab
:let g:Tex_ViewRule_pdf = 'Preview'
"-------------------------------------------------------------
"NerdTree Plugin Settings
"-------------------------------------------------------------
"down't display the following files
let NERDTreeIgnore=['\.pyc$', '\.xls$','\.zip$','\.pdf']
nmap <silent> <D-d> :NERDTreeToggle<CR>
let g:NERDTreeWinPos = "left"
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
let NERDTreeQuitOnOpen=1
"let NERDTreeShowHidden=1
hi Title guifg=red guibg=#202020
"-------------------------------------------------------------
"Tlist Plugin Settings
"-------------------------------------------------------------
let Tlist_Use_Right_Window   = 1
"nmap <silent> <D-k> :TlistToggle<CR>
nmap <silent> <Leader>k :TlistToggle<CR>
"-------------------------------------------------------------
"Conque Plugin Settings
"-------------------------------------------------------------
nmap <silent> <D-i> :ConqueTermVSplit ipython<CR>
let g:ConqueTerm_SendVisKey = '<C-i>'

function! RunConque()
let filepath = %:p
ConqueTermSplit ipython -c "run"filepath
endfunction
nmap <silent> ,,r :execute 'ConqueTermSplit ipython '.expand('%:p')<CR>
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
let g:snippets_dir = "~/.vim/bundle/snipmate/snippets/,~/.vim/mysnipets/"
"let g:snippets_dir = "~/.vim/mysnipets/,~/.vim/bundle/snipmate/snippets/"
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
"tur
"noff minibufexpl
let loaded_minibufexplorer=1
"-------------------------------------------------------------
"Buftabs Plugin Settings
"-------------------------------------------------------------
"let g:buftabs_in_statusline=1
":noremap <C-left> :bprev<CR>
let g:buftabs_only_basename=1
noremap <C-TAB> :bnext<CR>
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
"json
au BufNewFile,BufRead *.json setfiletype javascript
"-------------------------------------------------------------
"AutoComplete Popup Plugin Settings
"-------------------------------------------------------------
map <Leader>ace :AcpEnable<CR>
map <Leader>acd :AcpDisable<CR>
let g:acp_behaviorSnipmateLength=1
"-------------------------------------------------------------
"Supertab  Plugin Settings
"-------------------------------------------------------------
let loaded_supertab=1
"-------------------------------------------------------------
"taglist Settings
"-------------------------------------------------------------
"add objc to taglist
let tlist_objc_settings='objc;P:protocols;i:interfaces;I:implementations;M:instance methods;C:implementation methods;Z:protocol methods'
"use brew ctags
let Tlist_Ctags_Cmd='/usr/local/bin/ctags'
"-------------------------------------------------------------
"make green plugin
"-------------------------------------------------------------
map <Leader>nose :call MakeGreen()<CR>
"-------------------------------------------------------------
"CommanT plugin
"-------------------------------------------------------------
nmap <Leader>t :CommandT<CR>
let g:CommandTMaxHeight = 15
set wildignore+=.git,*.pyc,*.png,*.jpg,*.zip,*.xls,*.xlsx
"-------------------------------------------------------------
"Ack plugin
"-------------------------------------------------------------
nnoremap <Leader>a :Ack --follow <C-r><C-w>
"-------------------------------------------------------------
"CTAGS plugin
"-------------------------------------------------------------
" Set the tags files to be the following
set tags=./tags,tags,pytags
"-------------------------------------------------------------
"Fuzzy Finder plugin
"-------------------------------------------------------------

nmap <Leader>ff :FuzzyFinderFile<CR>
nmap <Leader>fb :FuzzyFinderBuffer<CR>
nmap <Leader>ft :FuzzyFinderTag<CR>

"-------------------------------------------------------------
"ZoomWin plugin
"-------------------------------------------------------------
nmap <Leader>z :ZoomWin<CR>
" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

"-------------------------------------------------------------
"OpenTerminal plugin
"-------------------------------------------------------------
"
nnoremap <silent> <Leader>ot :OpenTerminal<CR>
nnoremap <silent> <Leader>of :OpenFilemanager<CR><CR>

nnoremap <silent> <Leader>oi :OpenIterm<CR>

"-------------------------------------------------------------
"Timux helper
"-------------------------------------------------------------
function! OpenTimuxWindow()
  let l:current_dir = getcwd()
  execute("chdir " . escape(expand("%:p:h"), " \"'"))
  let l:cmd = 'tmux neww "cd $current_path;exec $SHELL"'
  let l:cmd = substitute( l:cmd, "$current_path", "'" . expand("%:p:h") . "'" , "g")
  call system (l:cmd)
endfunction

nmap <silent><Leader>ou : call OpenTimuxWindow()<CR>
"-------------------------------------------------------------
"Easymotion plugin
"-------------------------------------------------------------
"let g:EasyMotion_leader_key = '<Leader>m'

"-------------------------------------------------------------
"Yankring plugin
"-------------------------------------------------------------
nnoremap <silent> <Leader>y :YRShow<cr>
inoremap <silent> <Leader>y <ESC>:YRShow<cr>
let g:yankring_history_dir = "$HOME/.vim/"
let g:yankring_history_file = 'yankring_history'
"-------------------------------------------------------------
"MRU plugin
"-------------------------------------------------------------
nnoremap <silent> <Leader>mr :MRU<CR>
"-------------------------------------------------------------
"neocomplete plugin
"-------------------------------------------------------------
" Disable AutoComplPop.
let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1
"call add(s:snippets_dir,'~/.vim/bundle/snipmate/snippets/')
let g:neocomplcache_snippets_dir='~/.vim/mysnipets'
map <Leader>nce :NeoComplCacheEnable<CR>
map <Leader>ncd :NeoComplCacheDisable<CR>
"-------------------------------------------------------------
"Gundo plugin
"-------------------------------------------------------------
nnoremap <Leader>g :GundoToggle<CR>

"-------------------------------------------------------------
"Sweave
"-------------------------------------------------------------
map <Leader>swe :execute '!/usr/local/bin/R CMD Sweave '.expand('%:p')<CR>
"-------------------------------------------------------------
"Ropevim
"-------------------------------------------------------------
let ropevim_vim_completion=1
"-------------------------------------------------------------
"Pweave
"-------------------------------------------------------------
autocmd BufNewFile,BufRead *.Pnw set filetype=python
