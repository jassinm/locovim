call plug#begin('~/.vim/plugged')

" Look good ---------------------------------------------------------------- {{{
Plug 'nanotech/jellybeans.vim'
Plug 'sjl/badwolf'
Plug 'tomasr/molokai'
Plug 'godlygeek/csapprox'
Plug 'altercation/vim-colors-solarized'
Plug 'sickill/vim-monokai'
"}}}

" Latest ---------------------------------------------------------------- {{{
Plug 'Lokaltog/vim-easymotion'
Plug 'xaviershay/tslime.vim'
Plug 'SirVer/ultisnips'
Plug 'scrooloose/nerdtree'
Plug 'mileszs/ack.vim'
Plug 'vim-scripts/ZoomWin'
Plug 'vim-scripts/open-terminal-filemanager'
Plug 'Shougo/neocomplcache'
Plug 'gregsexton/gitv'
Plug 'sjl/gundo.vim'
Plug 'kien/ctrlp.vim'
Plug 'vim-scripts/swap-parameters'
Plug 'xolox/vim-easytags'
Plug 'majutsushi/tagbar'
Plug 'bling/vim-airline'
Plug 'scrooloose/syntastic'
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'
Plug 'gmarik/sudo-gui.vim'
Plug 'gcmt/wildfire.vim'
" }}}

"Tpope plugins -------------------------------------------- {{{
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'tpope/vim-speeddating'
" }}}

"Clojure ---------------------------------------------------------------- {{{
Plug 'guns/vim-clojure-static', {'for': 'clojure'}
Plug 'tpope/vim-classpath', {'for': 'clojure'}
Plug 'tpope/vim-foreplay', {'for': 'clojure'}
" }}}

"Python ---------------------------------------------------------------- {{{
Plug 'jmcantrell/vim-virtualenv', {'for': 'python'}
Plug 'ivanov/vim-ipython', {'for': 'python'}
Plug 'xolox/vim-misc'
Plug 'xolox/vim-pyref', {'for': 'python'}
Plug 'davidhalter/jedi-vim', {'for': 'python'}
" }}}

"Web dev -------------------------------------------------------- {{{
Plug 'mattn/emmet-vim'
Plug 'nono/jquery.vim'
"}}}

"C/C++ ------------------------------------------------------------ {{{
Plug 'vim-scripts/Cpp11-Syntax-Support'
Plug 'vim-scripts/scons.vim'
Plug 'vim-scripts/a.vim'
"}}}

"Scala ---------------------------------------------------------------- {{{
Plug 'derekwyatt/vim-scala', {'for': 'scala'}
" }}}

"Erlang ---------------------------------------------------------------- {{{
Plug 'jimenezrick/vimerl', {'for': 'erlang'}
Plug 'edkolev/erlang-motions.vim', {'for': 'erlang'}
" }}}

"Latex ---------------------------------------------------------------- {{{
Plug 'mineiro/vim-latex', {'for': 'tex'}
" }}}

"Objective-J ---------------------------------------------------------------- {{{
Plug 'nanki/vim-objj', {'for': 'objj'}
" }}}

"Json ---------------------------------------------------------------- {{{
Plug 'leshill/vim-json', {'for': 'json'}
" }}}

"Objc ---------------------------------------------------------------- {{{
Plug 'msanders/cocoa.vim', {'for': 'objc'}
" }}}

"R ---------------------------------------------------------------- {{{
Plug 'vim-scripts/Vim-R-plugin', {'for': 'r'}
" }}}

"Drake ---------------------------------------------------------------- {{{
Plug 'https://bitbucket.org/larsyencken/vim-drake-syntax.git'
" }}}

"RST ---------------------------------------------------------------- {{{
Plug 'vim-scripts/rest.vim'
Plug 'vim-scripts/VST'
Plug 'nvie/vim-rst-tables'
Plug 'vim-scripts/DotOutlineTree'
" }}}

"Other ---------------------------------------------------------------- {{{
"Plug 'matthias-guenther/hammer.vim'
Plug 'vim-scripts/SearchComplete'
Plug 'tsaleh/vim-align'
Plug 'IndexedSearch'
"Editing
Plug 'kana/vim-smartinput'
"help
Plug 'sjbach/lusty'
Plug 'kien/rainbow_parentheses.vim'
"Nice markers
Plug 'kshenoy/vim-signature'
Plug 'nathanaelkane/vim-indent-guides'
Plug 'sjl/clam.vim'
Plug 'AndrewRadev/linediff.vim'
Plug 'goldfeld/vim-seek'
Plug 'vim-scripts/LargeFile'
"vim scripting
Plug 'vim-scripts/reload.vim'

call plug#end()
"Alt key
if has("gui_mac")
    set macmeta
endif

"Set up the window colors and size
if has('gui_running')
    " GUI colors
    "colorscheme jellybeans
    " colorscheme jellybeans_locojay
    colorscheme badwolf

    let g:molokai_original = 1
    "set guifont=Monaco:h12
    if has("gui_gtk2")
        set guifont=PragmataPro\ 15
    else
        set guifont=PragmataPro:h15
    endif
    set guioptions=egmrt
    set guioptions-=T
    winpos 0 0
    winsize 270 70
    set go-=L
    set go-=r
elseif $TERM == "xterm-256color" || $TERM == "screen-256color"
    " Non-GUI (terminal) colors
    set t_Co=256
    "colorscheme jellybeans
    " colorscheme jellybeans_locojay
    "let g:molokai_original=1
    "let g:rehash256=1
    colorscheme badwolf
    "colorscheme molokai
    "set guifont=Monaco:h12
    set guifont=PragmataPro:h15
    set lazyredraw
endif
" }}}

"Vim Settings---------------------------------------------------------------- {{{

let mapleader=","
let maplocalleader = "\\"

"save a keypress
map ; :

set encoding=utf-8

set fillchars+=vert:│

filetype plugin indent on

" Set backspace config
set backspace=eol,start,indent
set showbreak=↪

"shut up
set visualbell           " don't beep
set noerrorbells         " don't beep

"Motion Settings
"Life saver
ino jk <esc>
cno jk <esc>

"visual
vnoremap < <gv
vnoremap > >gv

"got to middle of the line (vimbits.com)
nnoremap gm :call cursor(0, len(getline('.'))/2)<cr>

"show invisible shars
set list
set listchars=tab:▸\ ,eol:¬
set cpoptions+=$
"add line numbers
set number
function! ToggleRelativeNumber()
    if &nu == 1
        set rnu
    else
        set nu
    endif
endfunction

command! Rn call ToggleRelativeNumber()

syntax on

set noswapfile

" Mouse Support
"add mouse support
set mouse=a
"let this work in tmux 2
set ttymouse=xterm2


"fast
set ttyfast

"undo statck
set undofile
"enable backups
set backup
set undodir=$HOME/.vim/tmp/undo/
set backupdir=$HOME/.vim/tmp/backup/
set directory=$HOME/.vim/tmp/swap/

" Make those folders automatically if they don't already exist.
if !isdirectory(expand(&undodir))
    call mkdir(expand(&undodir), "p")
endif
if !isdirectory(expand(&backupdir))
    call mkdir(expand(&backupdir), "p")
endif
if !isdirectory(expand(&directory))
    call mkdir(expand(&directory), "p")
endif



" Clipboad and Pasting
"add to clipbord
set clipboard+=unnamed
"paste mode
"nnoremap <F5> :set invpaste paste?<CR>
"set pastetoggle=<F5>
set showmode
"auto paste in paste mode
imap <Leader>v  <C-O>:set paste<CR><C-r>*<C-O>:set nopaste<CR>

" tell VIM to always put a status line in, even if there is only one window
set laststatus=2
"keep a longer history
set history=1000

" Time out on key codes but not mappings.
" Basically this makes terminal Vim work sanely.
" sjl
set notimeout
set ttimeout
set ttimeoutlen=10

" }}}

"Completion/Wildmenu ----------------------------------------------------------- {{{
set wildmode=longest:full
set wildmenu
set completeopt=menu,preview
"autoclose preview window
if has("autocmd")
    autocmd CursorMovedI * if pumvisible() == 0|pclose|endif
    autocmd InsertLeave * if pumvisible() == 0|pclose|endif
endif
"omnifocus as constrol space
" inoremap <expr> <C-Space> pumvisible() \|\| &omnifunc == '' ?
"             \ "\<lt>C-n>" :
"             \ "\<lt>C-x>\<lt>C-o><c-r>=pumvisible() ?" .
"             \ "\"\\<lt>c-n>\\<lt>c-p>\\<lt>c-n>\" :" .
"             \ "\" \\<lt>bs>\\<lt>C-n>\"\<CR>"
" imap <C-@> <C-Space>

set wildignore=*.swp,*.bak
set wildignore+=*/.svn/*,/*.hg/*,/*.git/* " Version control (not git as otherwise conflict with fugitive)
set wildignore+=*/.virtualenvs/*
set wildignore+=*.aux,*.out,*.toc " LaTeX stuff
set wildignore+=*.jpg,*.bmp,*.gif,*.png,*.jpeg "Pics
set wildignore+=*.o,*.obj,*.pyc,*.class "compiled files, bytecode
set wildignore+=*.DS_Store
set wildignore+=*.pdf,*.xls,*.xlsx,*.doc
set wildignore+=*.jar
set wildignore+=*.beam
" Lein
set wildignore+=classes
set wildignore+=lib

" }}}

" Buffer/Tab/Window nativgation ----------------------------------------------------------- {{{
set hidden "Allows to change buffer w/o saving current buffer


noremap <silent><Leader>bn :bn<CR>
noremap <silent><Leader>bp :bp<CR>
noremap <silent><Leader>ba :1,300 bd!<CR> "close all buffer


"Tab commands
noremap <silent> <Leader>tp :tabprevious<CR>
noremap <silent> <Leader>tn :tabnext<CR>

"Windows Settings
" Move the cursor to the window left of the current one
noremap <silent><Leader>wh :wincmd h<cr>
" Move the cursor to the window below the current one
noremap <silent><Leader>wj :wincmd j<cr>
" Move the cursor to the window above the current one
noremap <silent><Leader>wk :wincmd k<cr>
" Move the cursor to the window right of the current one
noremap <silent><Leader>wl :wincmd l<cr>

noremap <silent><Leader>cj :wincmd j<CR>:close<CR>
noremap <silent><Leader>ck :wincmd k<CR>:close<CR>
noremap <silent><Leader>ch :wincmd h<CR>:close<CR>
noremap <silent><Leader>cl :wincmd l<CR>:close<CR>
noremap <silent><Leader>cc :wincmd c<CR>:close<CR>

noremap <silent><Leader>wr :wincmd r<CR>
noremap <silent><Leader>wo :wincmd o<CR>
noremap <silent><Leader>wx :wincmd x<CR>
noremap <silent><Leader>ww :wincmd w<CR>


noremap <silent><Leader>ws :split <CR>
noremap <silent><Leader>wv :vsplit <CR>

"Quickfix window Settings
"use vim -unimpaired
"noremap <silent> ,cn :cn<CR>
"noremap <silent> ,cp :cp<CR>

"location list
noremap <silent> <leader>lo :lopen<CR>

" }}}

"Some more-------------------------------------------------- {{{
nmap <silent> <Leader>ev :vsplit $HOME/.vimrc<CR>
nmap <silent> <Leader>sv :so $HOME/.vimrc<CR>

" When pressing <leader>cd switch to the directory of the open buffer
map <silent><Leader>cd :cd %:p:h<CR>
"Move lines up and down
nnoremap <M-j> :m+<CR>==
nnoremap <M-k> :m-2<CR>==
inoremap <M-j><Esc> :m+<CR>==gi
inoremap <M-k><Esc> :m-2<CR>==gi
vnoremap <M-j> :m'>+<CR>gv=gv
vnoremap <M-k> :m-2<CR>gv=gv
"Calculator
inoremap <C-B> <C-O>yiW<End>=<C-R>=<C-R>0<CR>
"urlview
noremap <silent><leader>u :! urlview %<CR>
" }}}

"Search Settings -------------------------------------------------- {{{

nnoremap / /\v
vnoremap / /\v
set smartcase
set incsearch "search as you type
set gdefault "always /g
set ignorecase
set showmatch "show matching braces
set hlsearch
"replace word under cursor
nnoremap <Leader>s :%s/\<<C-r><C-w>\>/
map <silent><Leader><space> :noh<CR>

"Spell Checking
map <leader>ss :setlocal spell! spelllang=en_us<cr>
" }}}

"Folding ------------------------------------------------ {{{
" Javadoc comments (/** and */ pairs) and code sections (marked by {} pairs) mark the start and end of folds. All other
" lines simply take the fold level that is going so far.
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

"}}}

" Default Tabs, spaces, wrapping ------------------------------------ {{{
set tabstop=4
set shiftwidth=4
set softtabstop=4
set expandtab
set wrap
set textwidth=85
set formatoptions=qrn1

" }}}

"Filetype Settings -------------------------------------------------{{{
if has("autocmd")
    "All filetypes
    "remove trailing whitespaces
    autocmd BufWritePre * :%s/\s\+$//e

    "vim
    au FileType vim setlocal foldmethod=marker

    "Large files
    autocmd BufReadPost * if getfsize(bufname("%")) > 512*1024 | set syntax=| set filetype=| endif

    "Help
    "help in vertical split
    autocmd FileType help wincmd L

    " R
    autocmd FileType r setlocal ts=8 sts=4 sw=4 expandtab

    "Html
    autocmd FileType html setlocal ts=2 sts=2 sw=2 expandtab
    autocmd FileType htmldjango setlocal ts=2 sts=2 sw=2 expandtab

    "Yml
    autocmd FileType yaml setlocal ts=2 sts=2 sw=2 expandtab

    "Erlang
    autocmd FileType erlang setlocal ts=8 sts=4 sw=4 expandtab

    "Python
    autocmd FileType python setlocal ts=8 sts=4 sw=4 expandtab
    autocmd FileType python setlocal autoindent
    "nose for unittest
    autocmd FileType python compiler nose
    autocmd FileType python set omnifunc=pythoncomplete#Complete
    autocmd FileType python set formatprg=PythonTidy
    autocmd BufNewFile,BufRead *.pyx setlocal foldmethod=indent
    if exists('+colorcolumn')
          " autocmd FileType python set colorcolumn=80
    endif
    "Clojure"
    " autocmd FileType clojure set ts=2 sts=2 sw=2 expandtab
    autocmd FileType clojure compiler clojure
    autocmd FileType clojure silent! call TurnOnClojureFolding()
    autocmd BufNewFile,BufRead *.clj set filetype=clojure
    autocmd Filetype clojure setlocal lispwords+=defpage,defpartial,deftest,defroute

    "clojurescript
    autocmd BufNewFile,BufRead *.cljs set filetype=clojure

    "
    "Css
    autocmd Filetype css set omnifunc=csscomplete#CompleteCSS

    "Javascript
    autocmd Filetype javascript setlocal ts=4 sts=4 sw=4 expandtab
    autocmd BufRead,BufNewFile jquery.*.js set ft=javascript syntax=jquery

    "Tex
    autocmd FileType tex setlocal ts=8 sts=4 sw=4 expandtab

    "Json
    autocmd BufNewFile,BufRead *.json setfiletype json

    "Processing
    autocmd BufNewFile,BufRead *.pde setfiletype processing

    "Pweave
    autocmd BufNewFile,BufRead *.Pnw set filetype=python

    "Objective-j
    au BufNewFile,BufRead *.j  setfiletype objc
    au BufNewFile,BufRead *.j  setlocal ts=8 sts=4 sw=4 expandtab
    au BufNewFile,BufRead *.j setlocal foldexpr=MyFoldLevel(v:lnum)
    au BufNewFile,BufRead *.j setlocal foldmethod=expr

    "Java
    au Filetype java setlocal foldexpr=MyFoldLevel(v:lnum)
    au Filetype java setlocal foldmethod=expr

    "Sweave
    au BufNewFile,BufRead *.Rnw map <Leader>swe :execute '!/usr/local/bin/R CMD Sweave '.expand('%:p')<CR>

    au BufRead ~/.mutt/temp/mutt* set spell
    "Mutt

    "Scala
    autocmd BufNewFile,BufRead *.scala set filetype=scala

    "Scons
    autocmd BufNewFile,BufRead SConstruct set filetype=scons

    "C++11
    autocmd BufNewFile,BufRead *.cpp set syntax=cpp11
    autocmd BufNewFile,BufRead *.hpp set syntax=cpp11




endif

" }}}

"Python Settings/Plugins --------------------------------------------- {{{
function! PythonTidySaver()
    let oldpos=getpos('.')
    %!PythonTidy
    call setpos('.',oldpos)
endfunction

"autocmd! bufwritepost *.py call PythonTidySaver()
"Virtualenv
if  has('python')
    if !empty($VIRTUAL_ENV)
        let g:virtualenv_auto_activate=1
    endif

    "make sure to change /etc/paths"
    function! MakePyProjet(projectname)
        " execute '!source /usr/local/share/python/virtualenvwrapper.sh'
        execute '!mkproject& -t locodev ' . a:projectname
    endfunction
else
    "ack to make vi work
    function! VirtualEnvStatusline()
    endfunction

endif

"tmux does no like C-s
let g:ipy_perform_mappings = 0
autocmd FileType python map<silent>K :py get_doc_buffer()<CR>
autocmd FileType python map<silent><C-i> :python run_this_line()<CR>
autocmd FileType python vmap <silent> <C-i> :python run_these_lines()<CR>
function! IPythonShell()
  :py if update_subchannel_msgs(force=True): echo("vim-ipython shell updated",'Operator')
endfunction

command! IPythonShell call IPythonShell()


"make green plugin
Plug 'reinh/vim-makegreen'
map <Leader>nose :call MakeGreen()<CR>

if has('python')
    Plug 'nvie/vim-pyunit'
    let g:PyUnitCmd = '/usr/local/share/python/nosetests -q --with-machineout'
    if !empty($VIRTUAL_ENV)
        let g:PyUnitCmd = $VIRTUAL_ENV . '/bin/nosetests -q --with-machineout'
    endif
    let g:PyUnitTestsStructure="nose"
    autocmd Filetype python noremap <Leader>nose :call PyUnitRunTests()<CR>
    autocmd Filetype python noremap! <Leader>nose <Esc>:call PyUnitRunTests()<CR>
    autocmd Filetype python noremap <Leader>ut :call PyUnitSwitchToCounterpart()<CR>
    autocmd Filetype python noremap! <Leader>ut <ESC>:call PyUnitSwitchToCounterpart()<CR>
endif

"Ropevim
let ropevim_vim_completion=1

"Pep8 plugin # using flake8
if has('python')
    "Plug 'orestis/pysmell.git'
    if executable("pep8")
        "Plug 'nvie/vim-pep8.git'
        "autocmd FileType python map <buffer> <Leader>p :call Pep8()<CR>
    endif
endif

"Pydoc, Pyref plugin
let g:jedi#use_tabs_not_buffers = 0
let g:jedi#goto_definitions_command = "<leader>D"
let g:jedi#rename_command = "<leader>r"
"using neocompletecache
let g:jedi#popup_on_dot = 0



"Plug 'fs111/pydoc.vim'
let g:pydoc_cmd='/usr/local/bin/pydoc'

" }}}

"Latex Plugin ---------------------------------------------------- {{{

let g:Tex_DefaultTargetFormat='pdf'
let g:Tex_CompileRule_pdf = 'mkdir -p latex-build; /usr/texbin/pdflatex -output-directory latex-build -interaction nonstopmode $*; cp latex-build/*.pdf .'
let g:Tex_ViewRule_pdf = 'Preview'
let g:Tex_IgnoredWarnings="Font""\n"
let g:Tex_IgnoredWarnings =
                \'Underfull'."\n".
                \'Overfull'."\n".
                \'specifier changed to'."\n".
                \'You have requested'."\n".
                \'Missing number, treated as zero.'."\n".
                \'There were undefined references'."\n".
                \'Latex Warning:'."\n".
                \'LaTeX Warning:' " float stuck
let g:Tex_IgnoreLevel = 8

" }}}

"NerdTree Plugin---------------------------------------------------- {{{

nmap <silent><Leader>ft :NERDTreeToggle<CR>
nmap <silent><leader>nf :NERDTreeFind<CR>

let g:NERDTreeWinPos = "left"
"down't display the following files
let NERDTreeIgnore=['\.DS_Store$','\.pyc$', '\.xls$','\.zip$','\.pdf$','\.nav$','\.snm$','.\toc$','\.vrb$','\.aux$' , '\.git$', '\.db$', '\.ropeproject', '\.so$', '\.un\~$', '\.lein-plugins$', '\.beam$']
let NERDTreeHighlightCursorline=1
" Show the bookmarks table on startup
let NERDTreeShowBookmarks=1
"quit after opening a file
let NERDTreeQuitOnOpen=1
let NERDTreeShowHidden=1
"some styling
let NERDTreeDirArrows = 1
"hi Title guifg=red guibg=#202020
if has("autocmd")
    autocmd Filetype nerdtree setlocal nolist
endif

" }}}

"Ultinips Settings------------------------------------------------------- {{{
if has('python')

    let g:UltiSnipsEditSplit='vertical'
    let g:UltiSnipsUsePythonVersion = 2
    autocmd BufNewFile,BufRead *.snippets set filetype=snippets

    "does not seem to work so call it"
    nnoremap <Leader>us :call UltiSnips_ListSnippets()<CR>
    inoremap <Leader>us <ESC>:call UltiSnips_ListSnippets()<CR>

    let g:UltiSnipsExpandTrigger="<c-j>"
    let g:UltiSnipsJumpForwardTrigger="<c-j>"
    let g:UltiSnipsJumpBackwardTrigger="<c-k>"

    autocmd Filetype python :UltiSnipsAddFiletypes python
    autocmd Filetype html :UltiSnipsAddFiletypes html
    autocmd Filetype c :UltiSnipsAddFiletypes c
    autocmd Filetype cpp :UltiSnipsAddFiletypes cpp

endif

" }}}

"Objective-J Settings--------------------------------------------------------- {{{
"vim objj
set runtimepath+=~/.vim/bundle/vim-objj

" }}}

"Ack plugin -----------------------------------------------------------------{{{
nnoremap <Leader>ag :Ack --follow <C-r><C-w>
let g:ackprg = 'ag --nogroup --nocolor --column'

" }}}

"ZoomWin plugin ------------------------------------------------------------{{{

nnoremap <Leader>z :ZoomWin<CR>
inoremap <Leader>z <ESC>:ZoomWin<CR>
" Without setting this, ZoomWin restores windows in a way that causes
" equalalways behavior to be triggered the next time CommandT is used.
" This is likely a bludgeon to solve some other issue, but it works
set noequalalways

" }}}

"OpenTerminal plugin -------------------------------------------------------- {{{

nnoremap <silent><Leader>of :OpenFilemanager<CR><CR>

" }}}

"Easymotion plugin ---------------------------------------------------------- {{{

let g:EasyMotion_leader_key = 'e'

" }}}

"Yankring plugin ------------------------------------------------------------- {{{
Plug 'vim-scripts/YankRing.vim'

nnoremap <silent><Leader>y :YRShow<cr>
inoremap <silent><Leader>y <ESC>:YRShow<cr>
let g:yankring_history_dir = "$HOME/.vim/"
let g:yankring_history_file = 'yankring_history'

nnoremap <leader>Y :call system('nc localhost 8377', @0)<CR>


" }}}

"Neocomplete plugin ---------------------------------------------------------- {{{

" Disable AutoComplPop.
"let g:acp_enableAtStartup = 0
" Use neocomplcache.
let g:neocomplcache_enable_at_startup = 1
" Use smartcase.
let g:neocomplcache_enable_smart_case = 1
" Use camel case completion.
let g:neocomplcache_enable_camel_case_completion = 1
" AutoComplPop like behavior.
let g:neocomplcache_enable_auto_select = 1

" }}}

"Git plugins ------------------------------------------------------------------ {{{
"fugitive

nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gco :Gcheckout<CR>
nnoremap <Leader>gci :Gcommit<CR>
nnoremap <Leader>gl :Glog<CR>
nnoremap <Leader>gp :Git push<CR>
nnoremap <Leader>gcaa :Git commit -a --amend -C HEAD

"gitv

"Gundo plugin
if has('python')

    nnoremap <Leader>gu :GundoToggle<CR>
    "let g:gundo_debug = 1
    let g:gundo_preview_bottom = 1
endif

" }}}

"SQL plugin's --------------------------------------------------{{{
"dbext <Leaeder>se
let dbext_default_DB2_bin='db2batch'
"let g:dbext_default_DB2_cmd_options="-q on -s off -l ';'"
"let g:dbext_default_DB2_cmd_options="-q del -s off"
"let dbext_default_DB2_cmd_terminator=""
"let dbext_default_DB2_cmd_terminator="':';"
"output command
"let dbext_default_display_cmd_line=1

"}}}

"Swap parameters plugin-------------------------------------------------{{{
if has('python')
    noremap gb :call SwapParams("forwards")<cr>
    noremap gB :call SwapParams("backwards")<cr>
endif

"}}}

"Ctrl-p plugin-----------------------------------------------------------------{{{

let g:ctrlp_map = '<leader>,'
let g:ctrlp_jump_to_buffer = 0
let g:ctrlp_working_path_mode = 0
let g:ctrlp_match_window_reversed = 1
let g:ctrlp_split_window = 0
let g:ctrlp_max_height = 20
let g:ctrlp_open_new_file = 'v'
let g:ctrlp_extensions = ['tag']
let g:ctrlp_prompt_mappings = {
\ 'PrtSelectMove("j")':   ['<c-j>', '<down>', '<s-tab>'],
\ 'PrtSelectMove("k")':   ['<c-k>', '<up>', '<tab>'],
\ 'PrtHistory(-1)':       ['<c-n>'],
\ 'PrtHistory(1)':        ['<c-p>'],
\ 'ToggleFocus()':        ['<c-tab>'],
\ }
let g:ctrlp_extensions = ['tag']
" let g:ctrlp_custom_ignore = {
" \ 'dir' : '\.git/',
" \
" \ }
"let g:ctrlp_dont_split = 'NERD_tree_2'

nnoremap <leader>. :CtrlPTag<cr>
nnoremap <leader>mr :CtrlPMRUFiles<cr>

"}}}

"TAGS Settings ---------------------------------------------------------{{{
if executable('ctags')
    map \pyt :exe '!ctags -R --languages=python -f ./pytags ' . system('python -c "from distutils.sysconfig import get_python_lib; print get_python_lib()"')<CR>
    map <Leader>/ :exe '!ctags -R . ./tags'

    " Easy tags plugin
    let g:easytags_cmd = '/usr/local/bin/ctags'
    set tags=./tags;
    let g:easytags_dynamic_files = 1
    let g:easytags_async = 1

    let g:tagbar_ctags_bin='/usr/local/bin/ctags'
    "Tagbar Plugin Settings
    nmap <silent><Leader>k :TagbarToggle<CR>
endif
" }}}

"Visualization ---------------------------------------------------------{{{
"Powerline
" Plug 'Lokaltog/vim-powerline'
" let g:Powerline_symbols = "fancy"
let g:airline_powerline_fonts = 1

if has("autocmd")
  "autocmd bufwritepost .vimrc source $MYVIMRC
  "autocmd bufwritepost .vimrc call Pl#Load()
endif

"IndentationGuide <Leader>ig
let g:indent_guides_auto_colors = 0
autocmd VimEnter,Colorscheme * :hi IndentGuidesOdd  guibg=#998f84 ctermbg=245
autocmd VimEnter,Colorscheme * :hi IndentGuidesEven guibg=#d9cec3 ctermbg=252

"
" }}}

" TimeStamp plugin--------------------------------------------------{{{
"autocmd BufWritePre *.py :1,6s/T_IMESTAMP/TIMESTAMP/e
" }}}

" Syntastic plugin ---------------------------------------------------------- {{{
"checks syntax for multiple file type install
"   - cpp , c g++, gcc
"   - flake8 or pyflakes or pylint for python
"   - jsonlint for json
"   - java ?? / use eclim
"   - jslint for javascript

let g:syntastic_enable_signs = 1
let g:syntastic_auto_loc_list=2
let g:syntastic_python_checkers = ['flake8']



"use YoucompleteMe
" let g:syntastic_cpp_config_file='.clang_complete'
let g:syntastic_stl_format = '[%E{%e Errors}%B{, }%W{%w Warnings}]'
let g:syntastic_cpp_compiler = 'clang++'
let g:syntastic_cpp_compiler_options = ' -std=c++11 -stdlib=libc++ -Wall'
"erlang
let g:syntastic_erlang_checkers=['syntaxerl']
let g:syntastic_javascript_checkers = ['jshint']


" }}}

"Gitst plugin ------------------------------------------------------ {{{
let g:gist_clip_command = 'pbcopy'
let g:gist_detect_filetype = 1

"}}}

"Comments---------------------------------------------------------------{{{
"Plug 'scrooloose/nerdcommenter'

xmap <Leader>c  <Plug>Commentary
nmap <Leader>c  <Plug>Commentary
nmap <Leader>cc <Plug>CommentaryLine
au FileType htmldjango setlocal commentstring={#\ %s\ #}
au FileType jinja setlocal commentstring={#\ %s\ #}
au FileType clojurescript setlocal commentstring=;\ %s
au FileType scons setlocal commentstring=#\ %s
au FileType python setlocal commentstring=#\ %s

" Plug "tomtom/tcomment_vim"
" nnoremap <silent><leader>c :TComment<CR>
" vnoremap <silent><leader>c :TComment<CR>
"
" let g:tcomment_jinja="{#\ %s \#}""
"}}}

" Tmux -----------------------------------------------------------------{{{
if executable("tmux")
    "Plug 'vim-scripts/Screen-vim---gnu-screentmux'
    " Plug 'acustodioo/vim-tmux'
    " Plug 'benmills/vimux'


    "change pane number at runtime by setting
    function! TmuxPaneNumber()
          let b:tmux_panenumber = input("pane number: ", "", "custom,Tmux_Pane_Numbers")
    endfunction
    command! TmuxPaneNumber call TmuxPaneNumber()

    " Plug 'sjl/vitality.vim'
    " Save when losing focus
    " " Save when losing focus
    " au FocusLost * :silent! wall

endif

" }}}

"C/C++ ------------------------------------------------------------ {{{


" Plug 'Rip-Rip/clang_complete'
" autocmd FileType c let g:clang_user_options = "-std=c99 2>/dev/null || exit 0"
" autocmd FileType cpp let g:clang_user_options = "-std=c++11 2>/dev/null || exit 0"
" let g:clang_use_library=1
" let g:clang_library='/usr/lib'
" let g:clang_snippets=1
" let g:clang_snippets_engine='ultisnips'
" Plug 'osyo-manga/neocomplcache-clang_complete'
"
"Plug "Valloric/YouCompleteMe"
let g:ycm_key_detailed_diagnostics=''
"leave Ultisnips allone
" let g:ycm_key_list_select_completion=['']
" let g:ycm_key_list_previous_completion=['']

" let g:ycm_key_invoke_completion=''
nmap <silent><Leader> cm :YcmForceCompileAndDiagnostics<CR>
let g:ycm_filetype_specific_completion_to_disable = {'erl':1, 'hrl':1}

set makeprg=scons
"}}}

"Other ----------------------------------------------------- {{{
"Task Management
"Plug 'chrisbra/csv.vim'
command! CsvCleanup :%s/\%x0d/\r/

if has('ruby')
    "rst"
    let g:mdown_preview_cmd="/Users/locojay/.cabal/bin/pandoc -s --highlight-style pygments"
    Plug 'tpope/vim-markdown'
    Plug 'itspriddle/vim-marked'
endif



"Rainbow Parenthesis
let g:rbpt_max = 16
" autocmd FileType clojure RainbowParenthesesToggle
" au VimEnter * RainbowParenthesesToggle


" }}}

"Erlang ---------------------------------------------------------------- {{{
let erlang_force_use_vimerl_indent = 0
let erlang_skel_header = { "author": "Locojay", "owner" : "Locojay" }
let erlang_folding=1
                          "
"use syntastic
let erlang_show_errors = 0
" }}}

